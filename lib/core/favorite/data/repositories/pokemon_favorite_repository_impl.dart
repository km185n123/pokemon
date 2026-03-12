// lib/core/favorite/data/repositories/pokemon_favorite_repository_impl.dart

import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/utils/repository_handler.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/core/favorite/domain/repositories/pokemon_favorite_repository.dart';
import 'package:pokemon/core/favorite/data/dao/pokemon_favorite_local_data_source.dart';

class PokemonFavoriteRepositoryImpl implements PokemonFavoriteRepository {
  final PokemonFavoriteLocalDataSource local;

  PokemonFavoriteRepositoryImpl(this.local);

  @override
  Future<Either<Failure, void>> addFavorite(Pokemon pokemon) {
    return RepositoryHandler.runCache(() => local.addFavorite(pokemon));
  }

  @override
  Future<Either<Failure, void>> deleteFavorite(Pokemon pokemon) {
    return RepositoryHandler.runCache(() => local.deleteFavorite(pokemon));
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getFavoritePokemons() {
    return RepositoryHandler.runCache(() => local.getFavoritePokemons());
  }

  Future<Either<Failure, List<Pokemon>>> mergeFavorites(
    List<Pokemon> pokemons,
  ) {
    return RepositoryHandler.runCache(() async {
      final favorites = await local.getFavoritePokemons();
      final ids = favorites.map((e) => e.id).toSet();

      return pokemons
          .map((p) => p.copyWith(isFavorite: ids.contains(p.id)))
          .toList();
    });
  }
}
