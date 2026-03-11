import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';

class DeleteFavoritePokemon {
  final PokemonRepository repository;

  DeleteFavoritePokemon(this.repository);

  Future<Either<Failure, void>> call(Pokemon pokemon) {
    return repository.deleteFavorite(pokemon);
  }
}
