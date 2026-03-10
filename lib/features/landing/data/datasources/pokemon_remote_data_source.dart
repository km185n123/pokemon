import 'package:pokemon/core/network/api_client.dart';
import 'package:pokemon/core/network/requeststrategy/get_strategy.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_list_response_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';

import 'package:pokemon/core/network/api_endpoints.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListResponseDto> getPokemons(int offset);
  Future<PokemonDetailDto> getPokemonDetail(String url);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final ApiClient apiClient;

  PokemonRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<PokemonListResponseDto> getPokemons(int offset) {
    return apiClient.request(
      GetStrategy(),
      ApiEndpoints.pokemon,
      PokemonListResponseDto.fromJson,
      query: {'offset': offset, 'limit': 5},
    );
  }

  @override
  Future<PokemonDetailDto> getPokemonDetail(String url) {
    return apiClient.request(GetStrategy(), url, PokemonDetailDto.fromJson);
  }
}
