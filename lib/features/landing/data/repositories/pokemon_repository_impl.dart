import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/data/dao/pokemon_favorite_local_data_source.dart';

import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/services/pokemon_remote_service.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/landing/data/mappers/pokemon_mapper.dart';
import 'package:pokemon/features/landing/data/mappers/pokemon_detail_mapper.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon/features/profile/data/repositories/profile_repository_impl.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteService remoteService;
  final PokemonFavoriteLocalDataSource favoriteService;
  final PokemonLocalDataSource localDataSource;
  final CacheHandler cacheHandler;
  final ProfileRepository profileRepository;

  PokemonRepositoryImpl(
    this.remoteService,
    this.favoriteService,
    this.localDataSource,
    this.cacheHandler,
    this.profileRepository,
  );

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons([int offset = 0]) async {
    final offlineDbEnabled = await profileRepository.getOfflineDbEnabled();
    final skipCache = !offlineDbEnabled;

    return cacheHandler.run(
      skipCache: skipCache,
      remote: () async {
        return remoteService
            .fetchPokemonList(offset)
            .flatMap(remoteService.fetchPokemonDetails)
            .map(
              (dtos) =>
                  dtos.map((d) => PokemonModelMapper(d).toEntity()).toList(),
            )
            .flatMap(
              (pokemons) => TaskEither.tryCatch(() async {
                final favorites = await favoriteService.getFavoritePokemons();

                final ids = favorites.map((e) => e.id).toSet();

                return pokemons
                    .map((p) => p.copyWith(isFavorite: ids.contains(p.id)))
                    .toList();
              }, (e, _) => CacheFailure(e.toString())),
            )
            .run();
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
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(int id) async {
    return remoteService.fetchPokemonDetail(id).map((tuple) {
      final detailDto = tuple.$1;
      final speciesDto = tuple.$2;
      return PokemonDetailMapper(detailDto).toEntity(speciesDto);
    }).run();
  }
}
