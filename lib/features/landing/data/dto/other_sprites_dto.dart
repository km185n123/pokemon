import 'package:freezed_annotation/freezed_annotation.dart';
import 'official_artwork_dto.dart';

part 'other_sprites_dto.freezed.dart';
part 'other_sprites_dto.g.dart';

@freezed
abstract class OtherSpritesDto with _$OtherSpritesDto {
  const factory OtherSpritesDto({
    @JsonKey(name: "official-artwork") OfficialArtworkDto? officialArtwork,
  }) = _OtherSpritesDto;

  factory OtherSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesDtoFromJson(json);
}
