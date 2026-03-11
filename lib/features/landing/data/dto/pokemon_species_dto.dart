import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/features/landing/data/dto/flavor_text_dto.dart';
import 'package:pokemon/features/landing/data/dto/genus_dto.dart';

part 'pokemon_species_dto.freezed.dart';
part 'pokemon_species_dto.g.dart';

@freezed
abstract class PokemonSpeciesDto with _$PokemonSpeciesDto {
  const factory PokemonSpeciesDto({
    @JsonKey(name: 'flavor_text_entries')
    required List<FlavorTextDto> flavorTextEntries,
    required List<GenusDto> genera,
    @JsonKey(name: 'gender_rate') required int genderRate,
  }) = _PokemonSpeciesDto;

  factory PokemonSpeciesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesDtoFromJson(json);
}
