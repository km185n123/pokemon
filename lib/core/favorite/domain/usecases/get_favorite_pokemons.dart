import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/favorite/domain/repositories/pokemon_favorite_repository.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

class GetFavoritePokemons {
  final PokemonFavoriteRepository repository;

  GetFavoritePokemons(this.repository);

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getFavoritePokemons();
  }
}
