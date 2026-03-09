import 'package:freezed_annotation/freezed_annotation.dart';
import 'other_sprites_dto.dart';

part 'sprites_dto.freezed.dart';
part 'sprites_dto.g.dart';

@freezed
abstract class SpritesDto with _$SpritesDto {
  const factory SpritesDto({
    @JsonKey(name: "front_default") String? frontDefault,
    OtherSpritesDto? other,
  }) = _SpritesDto;

  factory SpritesDto.fromJson(Map<String, dynamic> json) =>
      _$SpritesDtoFromJson(json);
}
