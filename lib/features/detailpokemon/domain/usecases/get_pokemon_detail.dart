import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon/features/landing/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailUseCase {
  final PokemonRepository repository;

  GetPokemonDetailUseCase(this.repository);

  Future<Either<Failure, PokemonDetail>> call(int id) {
    return repository.getPokemonDetail(id);
  }
}
