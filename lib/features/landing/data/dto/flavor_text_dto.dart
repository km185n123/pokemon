import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/features/landing/data/dto/language_dto.dart';

part 'flavor_text_dto.freezed.dart';
part 'flavor_text_dto.g.dart';

@freezed
abstract class FlavorTextDto with _$FlavorTextDto {
  const factory FlavorTextDto({
    required String flavorText,
    required LanguageDto language,
  }) = _FlavorTextDto;

  factory FlavorTextDto.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextDtoFromJson(json);
}
