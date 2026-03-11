import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import 'package:pokemon/core/error/failure.dart';

import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/data/mappers/pokemon_mapper.dart';

import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;
  final CacheHandler cacheHandler;

  PokemonRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.cacheHandler,
  );

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons([int offset = 0]) {
    return cacheHandler.run(
      remote: () async {
        final listEither = await remoteDataSource.getPokemons(offset);

        return listEither.fold((failure) => Left(failure), (list) async {
          final futures = list.results.map(
            (e) => remoteDataSource.getPokemonDetail(e.url),
          );

          final detailsEither = await Future.wait(futures);

          final List<Pokemon> pokemons = [];
          for (final detail in detailsEither) {
            if (detail.isLeft()) {
              return Left(
                detail.fold(
                  (failure) => failure,
                  (_) => const ServerFailure('Unknown error'),
                ),
              );
            }
            detail.match((l) => null, (r) => pokemons.add(r.toEntity()));
          }

          final favoritesList = await localDataSource.getFavoritePokemons();
          final favoriteIds = favoritesList.map((p) => p.id).toSet();

          final mergedPokemons = pokemons
              .map(
                (p) => Pokemon(
                  id: p.id,
                  name: p.name,
                  image: p.image,
                  types: p.types,
                  isFavorite: favoriteIds.contains(p.id),
                ),
              )
              .toList();

          return Right(mergedPokemons);
        });
      },
      returnCacheOnError: offset == 0,
      saveCache: (data) async {
        if (offset == 0) {
          await localDataSource.clearCache();
        }
        await localDataSource.cachePokemons(data);
      },
      readCache: () async {
        final cached = await localDataSource.getCachedPokemons();
        return cached.isEmpty ? null : cached;
      },
    );
  }

  @override
  Future<Either<Failure, void>> addFavorite(Pokemon pokemon) async {
    try {
      await localDataSource.addFavorite(pokemon);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavorite(Pokemon pokemon) async {
    try {
      await localDataSource.deleteFavorite(pokemon);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getFavoritePokemons() async {
    try {
      final pokemons = await localDataSource.getFavoritePokemons();
      return Right(pokemons);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
