// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonSpeciesDto _$PokemonSpeciesDtoFromJson(Map<String, dynamic> json) =>
    _PokemonSpeciesDto(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => GenusDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      genderRate: (json['gender_rate'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonSpeciesDtoToJson(_PokemonSpeciesDto instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.flavorTextEntries,
      'genera': instance.genera,
      'gender_rate': instance.genderRate,
    };
