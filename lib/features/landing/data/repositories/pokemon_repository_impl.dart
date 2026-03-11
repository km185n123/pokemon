import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import 'package:pokemon/core/error/failure.dart';

import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/data/mappers/pokemon_mapper.dart';

import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon/core/network/api_endpoints.dart';

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

  @override
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(int id) async {
    // 1. Fetch from /pokemon/{id}
    final detailUrl = '${ApiEndpoints.pokemon}/$id';
    final detailResponse = await remoteDataSource.getPokemonDetail(detailUrl);

    if (detailResponse.isLeft()) {
      return Left(
        detailResponse.fold(
          (failure) => failure,
          (_) => const ServerFailure('Unknown error fetching detail'),
        ),
      );
    }
    final detailDto = detailResponse.getRight().toNullable()!;

    // 2. Fetch from /pokemon-species/{id}
    final speciesResponse = await remoteDataSource.getPokemonSpecies(id);

    if (speciesResponse.isLeft()) {
      return Left(
        speciesResponse.fold(
          (failure) => failure,
          (_) => const ServerFailure('Unknown error fetching species'),
        ),
      );
    }
    final speciesDto = speciesResponse.getRight().toNullable()!;

    // Extract Description (first English entry, fallback to any)
    String description = '';
    final flavorTexts = speciesDto.flavorTextEntries;
    if (flavorTexts.isNotEmpty) {
      final enEntry = flavorTexts.firstWhere(
        (entry) => entry.language.name == 'en',
        orElse: () => flavorTexts.first,
      );
      description = enEntry.flavorText.replaceAll(RegExp(r'[\n\f]'), ' ');
    }

    // Extract Category (first English entry, fallback to any)
    String category = '';
    final genera = speciesDto.genera;
    if (genera.isNotEmpty) {
      final enGenus = genera.firstWhere(
        (g) => g.language.name == 'en',
        orElse: () => genera.first,
      );
      category = enGenus.genus.replaceAll(' Pokémon', '');
    }

    // Extract Abilities
    final ability = detailDto.abilities.isNotEmpty
        ? detailDto.abilities.first.ability.name
        : 'Unknown';

    // Calculate Gender Rates
    double femalePercentage = 0;
    double malePercentage = 0;

    if (speciesDto.genderRate != -1) {
      femalePercentage = (speciesDto.genderRate / 8.0) * 100;
      malePercentage = 100 - femalePercentage;
    }

    // Weaknesses - we would ideally fetch /type/{name} for all types
    // For now, we mock it or extract it if we had a RemoteDataSource method for it.
    // Assuming we do not have it implemented in remoteDataSource yet to keep scope tight.
    // Returning an empty array for now or mocking common ones.
    final types = detailDto.types.map((e) => e.type.name).toList();
    final weaknesses = types;

    final heightMeters = detailDto.height / 10.0;
    final weightKg = detailDto.weight / 10.0;

    return Right(
      PokemonDetail(
        id: detailDto.id,
        name: detailDto.name,
        image: detailDto.sprites.other?.officialArtwork?.frontDefault ?? '',
        types: types,
        height: heightMeters,
        weight: weightKg,
        description: description,
        category: category,
        ability: ability,
        malePercentage: malePercentage,
        femalePercentage: femalePercentage,
        weaknesses: weaknesses,
      ),
    );
  }
}
