import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/utils/repository_handler.dart';
import 'package:pokemon/core/favorite/data/dao/pokemon_favorite_local_data_source.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class PokemonFavoriteService {
  final PokemonFavoriteLocalDataSource local;

  PokemonFavoriteService(this.local);

  TaskEither<Failure, List<Pokemon>> mergeFavorites(List<Pokemon> pokemons) {
    return TaskEither.tryCatch(
      () => local.getFavoritePokemons(),
      (e, _) => CacheFailure(e.toString()) as Failure,
    ).map((favorites) {
      final ids = favorites.map((e) => e.id).toSet();

      return pokemons
          .map((p) => p.copyWith(isFavorite: ids.contains(p.id)))
          .toList();
    });
  }

  Future<Either<Failure, void>> addFavorite(Pokemon pokemon) {
    return RepositoryHandler.runCache(() => local.addFavorite(pokemon));
  }

  Future<Either<Failure, void>> deleteFavorite(Pokemon pokemon) {
    return RepositoryHandler.runCache(() => local.deleteFavorite(pokemon));
  }

  Future<Either<Failure, List<Pokemon>>> getFavoritePokemons() {
    return RepositoryHandler.runCache(() => local.getFavoritePokemons());
  }
}
