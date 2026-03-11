import 'package:freezed_annotation/freezed_annotation.dart';
import 'type_dto.dart';
import 'sprites_dto.dart';
import 'package:pokemon/features/landing/data/dto/ability_dto.dart';

part 'pokemon_detail_dto.freezed.dart';
part 'pokemon_detail_dto.g.dart';

@freezed
abstract class PokemonDetailDto with _$PokemonDetailDto {
  const factory PokemonDetailDto({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<TypeDto> types,
    required SpritesDto sprites,
    required List<AbilityDto> abilities,
  }) = _PokemonDetailDto;

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailDtoFromJson(json);
}
