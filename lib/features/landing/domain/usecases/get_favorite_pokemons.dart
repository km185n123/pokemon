import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';

class GetFavoritePokemons {
  final PokemonRepository repository;

  GetFavoritePokemons(this.repository);

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getFavoritePokemons();
  }
}
