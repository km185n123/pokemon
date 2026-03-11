// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_text_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlavorTextDto _$FlavorTextDtoFromJson(Map<String, dynamic> json) =>
    _FlavorTextDto(
      flavorText: json['flavor_text'] as String,
      language: LanguageDto.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextDtoToJson(_FlavorTextDto instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
    };
