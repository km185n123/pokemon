// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpritesDto _$SpritesDtoFromJson(Map<String, dynamic> json) => _SpritesDto(
  frontDefault: json['front_default'] as String?,
  other: json['other'] == null
      ? null
      : OtherSpritesDto.fromJson(json['other'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpritesDtoToJson(_SpritesDto instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'other': instance.other,
    };
