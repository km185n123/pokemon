import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/network/api_client.dart';
import 'package:pokemon/core/network/requeststrategy/get_strategy.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_list_response_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';

import 'package:pokemon/core/network/api_endpoints.dart';

abstract class PokemonRemoteDataSource {
  Future<Either<Failure, PokemonListResponseDto>> getPokemons(int offset);
  Future<Either<Failure, PokemonDetailDto>> getPokemonDetail(String url);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final ApiClient apiClient;

  PokemonRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Either<Failure, PokemonListResponseDto>> getPokemons(int offset) {
    return apiClient.request(
      GetStrategy(),
      ApiEndpoints.pokemon,
      PokemonListResponseDto.fromJson,
      query: {'offset': offset, 'limit': 5},
    );
  }

  @override
  Future<Either<Failure, PokemonDetailDto>> getPokemonDetail(String url) {
    return apiClient.request(GetStrategy(), url, PokemonDetailDto.fromJson);
  }
}
