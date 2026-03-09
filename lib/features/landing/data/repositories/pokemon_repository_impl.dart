import 'package:dio/dio.dart';
import 'package:pokemon/core/base/base_repository.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:fpdart/fpdart.dart';

class PokemonRepositoryImpl extends BaseRepository
    implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons([int offset = 0]) async {
    try {
      // feat: implement caching strategy — fetch from API and save to DB
      final list = await remoteDataSource.getPokemons(offset);
      final futures = list.results.map(
        (e) => remoteDataSource.getPokemonDetail(e.url),
      );
      final details = await Future.wait(futures);

      final pokemons = details.map((e) {
        return Pokemon(
          id: e.id,
          name: e.name,
          image:
              e.sprites.other?.officialArtwork?.frontDefault ??
              e.sprites.frontDefault ??
              '',
          types: e.types.map((t) => t.type.name).toList(),
        );
      }).toList();

      // Cache the fresh data into the local DB
      await localDataSource.clearCache();
      await localDataSource.cachePokemons(pokemons);

      return Right(pokemons);
    } on DioException catch (e) {
      // feat: implement offline fallback — read from DB if API fails
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        final cached = await localDataSource.getCachedPokemons();
        if (cached.isNotEmpty) {
          return Right(cached);
        }
        return const Left(ConnectionFailure('connectionLostMessage'));
      }
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
