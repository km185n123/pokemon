import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/features/landing/data/dto/language_dto.dart';

part 'genus_dto.freezed.dart';
part 'genus_dto.g.dart';

@freezed
abstract class GenusDto with _$GenusDto {
  const factory GenusDto({
    required String genus,
    required LanguageDto language,
  }) = _GenusDto;

  factory GenusDto.fromJson(Map<String, dynamic> json) =>
      _$GenusDtoFromJson(json);
}
