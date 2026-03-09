import 'package:pokemon/features/landing/data/dto/pokemon_list_response_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:dio/dio.dart';

import 'package:pokemon/core/error/failure.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListResponseDto> getPokemons(int offset);
  Future<PokemonDetailDto> getPokemonDetail(String url);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonListResponseDto> getPokemons(int offset) async {
    final response = await dio.get(
      '/pokemon',
      queryParameters: {'offset': offset, 'limit': 20},
    );

    if (response.statusCode != 200) {
      throw const ServerFailure('Failed to load pokemons');
    }

    return PokemonListResponseDto.fromJson(response.data);
  }

  @override
  Future<PokemonDetailDto> getPokemonDetail(String url) async {
    // URL typically looks like https://pokeapi.co/api/v2/pokemon/1/
    // Since dio has BaseOptions.baseUrl set, we might need to use absolute URL or just the path.
    // However, dio.get(url) handles absolute URLs correctly and overrides the baseUrl.
    final response = await dio.get(url);

    if (response.statusCode != 200) {
      throw const ServerFailure('Failed to load pokemon detail');
    }

    return PokemonDetailDto.fromJson(response.data);
  }
}
