import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/domain/repositories/pokemon_favorite_repository.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class AddFavoritePokemon {
  final PokemonFavoriteRepository repository;

  AddFavoritePokemon(this.repository);

  Future<Either<Failure, void>> call(Pokemon pokemon) {
    return repository.addFavorite(pokemon);
  }
}
