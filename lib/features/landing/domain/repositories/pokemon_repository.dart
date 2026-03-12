import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:fpdart/fpdart.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons([int offset = 0]);
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(int id);
}
