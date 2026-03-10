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
        final list = await remoteDataSource.getPokemons(offset);

        final futures = list.results.map(
          (e) => remoteDataSource.getPokemonDetail(e.url),
        );

        final details = await Future.wait(futures);

        return details.map((e) => e.toEntity()).toList();
      },
      saveCache: (data) async {
        await localDataSource.clearCache();
        await localDataSource.cachePokemons(data);
      },
      readCache: () async {
        final cached = await localDataSource.getCachedPokemons();
        return cached.isEmpty ? null : cached;
      },
    );
  }
}
