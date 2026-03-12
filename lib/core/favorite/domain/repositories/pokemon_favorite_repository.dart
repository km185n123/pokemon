import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:fpdart/fpdart.dart';

abstract class PokemonFavoriteRepository {
  Future<Either<Failure, void>> addFavorite(Pokemon pokemon);
  Future<Either<Failure, void>> deleteFavorite(Pokemon pokemon);
  Future<Either<Failure, List<Pokemon>>> getFavoritePokemons();
}
