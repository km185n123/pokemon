import 'package:freezed_annotation/freezed_annotation.dart';

part 'official_artwork_dto.freezed.dart';
part 'official_artwork_dto.g.dart';

@freezed
abstract class OfficialArtworkDto with _$OfficialArtworkDto {
  const factory OfficialArtworkDto({String? frontDefault}) =
      _OfficialArtworkDto;

  factory OfficialArtworkDto.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkDtoFromJson(json);
}
