// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenusDto _$GenusDtoFromJson(Map<String, dynamic> json) => _GenusDto(
  genus: json['genus'] as String,
  language: LanguageDto.fromJson(json['language'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GenusDtoToJson(_GenusDto instance) => <String, dynamic>{
  'genus': instance.genus,
  'language': instance.language,
};
