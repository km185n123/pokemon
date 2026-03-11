import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_dto.freezed.dart';
part 'language_dto.g.dart';

@freezed
abstract class LanguageDto with _$LanguageDto {
  const factory LanguageDto({required String name, required String url}) =
      _LanguageDto;

  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);
}
