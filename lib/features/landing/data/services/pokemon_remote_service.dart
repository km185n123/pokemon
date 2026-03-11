import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_species_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_list_response_dto.dart';
import 'package:pokemon/core/network/api_endpoints.dart';

class PokemonRemoteService {
  final PokemonRemoteDataSource remote;

  PokemonRemoteService(this.remote);

  TaskEither<Failure, List<String>> fetchPokemonList(int offset) {
    return TaskEither<Failure, PokemonListResponseDto>(
      () => remote.getPokemons(offset),
    ).map((list) => list.results.map((e) => e.url).toList());
  }

  TaskEither<Failure, List<PokemonDetailDto>> fetchPokemonDetails(
    List<String> urls,
  ) {
    return TaskEither.traverseList(
      urls,
      (url) => TaskEither<Failure, PokemonDetailDto>(
        () => remote.getPokemonDetail(url),
      ),
    );
  }

  TaskEither<Failure, (PokemonDetailDto, PokemonSpeciesDto)> fetchPokemonDetail(
    int id,
  ) {
    final detailUrl = '${ApiEndpoints.pokemon}/$id';
    final detail = TaskEither<Failure, PokemonDetailDto>(
      () => remote.getPokemonDetail(detailUrl),
    );
    final species = TaskEither<Failure, PokemonSpeciesDto>(
      () => remote.getPokemonSpecies(id),
    );

    return detail.flatMap((d) => species.map((s) => (d, s)));
  }
}
