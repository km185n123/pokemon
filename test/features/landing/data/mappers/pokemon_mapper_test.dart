import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/sprites_dto.dart';
import 'package:pokemon/features/landing/data/dto/other_sprites_dto.dart';
import 'package:pokemon/features/landing/data/dto/official_artwork_dto.dart';
import 'package:pokemon/features/landing/data/dto/type_dto.dart';
import 'package:pokemon/features/landing/data/dto/type_info_dto.dart';
import 'package:pokemon/features/landing/data/mappers/pokemon_mapper.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

void main() {
  group('PokemonModelMapper', () {
    final tSpritesWithArtwork = const SpritesDto(
      other: OtherSpritesDto(
        officialArtwork: OfficialArtworkDto(frontDefault: 'official_url'),
      ),
      frontDefault: 'default_url',
    );

    final tPokemonDetailDto = PokemonDetailDto(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      types: [
        const TypeDto(
          type: TypeInfoDto(name: 'grass', url: ''),
        ),
      ],
      sprites: tSpritesWithArtwork,
      abilities: [],
    );

    test('should map DTO to Entity correctly with official artwork', () {
      // Act
      final result = tPokemonDetailDto.toEntity();

      // Assert
      expect(result.id, 1);
      expect(result.name, 'bulbasaur');
      expect(result.image, 'official_url');
      expect(result.types, ['grass']);
      expect(result.isFavorite, false);
      expect(result, isA<Pokemon>());
    });

    test('should use frontDefault sprite if official artwork is missing', () {
      // Arrange
      final tDtoNoOfficial = tPokemonDetailDto.copyWith(
        sprites: const SpritesDto(other: null, frontDefault: 'default_url'),
      );

      // Act
      final result = tDtoNoOfficial.toEntity();

      // Assert
      expect(result.image, 'default_url');
    });

    test('should return empty image string if all sprites are missing', () {
      // Arrange
      final tDtoNoSprites = tPokemonDetailDto.copyWith(
        sprites: const SpritesDto(other: null, frontDefault: null),
      );

      // Act
      final result = tDtoNoSprites.toEntity();

      // Assert
      expect(result.image, '');
    });
  });
}
