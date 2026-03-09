import 'package:freezed_annotation/freezed_annotation.dart';
import 'pokemon_result_dto.dart';

part 'pokemon_list_response_dto.freezed.dart';
part 'pokemon_list_response_dto.g.dart';

@freezed
abstract class PokemonListResponseDto with _$PokemonListResponseDto {
  const factory PokemonListResponseDto({
    required int count,
    String? next,
    String? previous,
    required List<PokemonResultDto> results,
  }) = _PokemonListResponseDto;

  factory PokemonListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseDtoFromJson(json);
}
