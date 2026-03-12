import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_species_dto.dart';
import 'package:pokemon/features/landing/data/dto/flavor_text_dto.dart';
import 'package:pokemon/features/landing/data/dto/genus_dto.dart';
import 'package:pokemon/features/landing/data/dto/language_dto.dart';
import 'package:pokemon/features/landing/data/dto/type_dto.dart';
import 'package:pokemon/features/landing/data/dto/type_info_dto.dart';
import 'package:pokemon/features/landing/data/dto/sprites_dto.dart';
import 'package:pokemon/features/landing/data/dto/other_sprites_dto.dart';
import 'package:pokemon/features/landing/data/dto/official_artwork_dto.dart';
import 'package:pokemon/features/landing/data/dto/ability_dto.dart';
import 'package:pokemon/features/landing/data/dto/ability_detail_dto.dart';
import 'package:pokemon/features/landing/data/mappers/pokemon_detail_mapper.dart';

void main() {
  group('PokemonDetailMapper', () {
    final tPokemonDetailDto = const PokemonDetailDto(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      types: [
        TypeDto(
          type: TypeInfoDto(name: 'grass', url: ''),
        ),
        TypeDto(
          type: TypeInfoDto(name: 'poison', url: ''),
        ),
      ],
      sprites: SpritesDto(
        other: OtherSpritesDto(
          officialArtwork: OfficialArtworkDto(frontDefault: 'url_image'),
        ),
      ),
      abilities: [
        AbilityDto(
          ability: AbilityDetailDto(name: 'overgrow', url: ''),
        ),
      ],
    );

    test('should map DTOs to PokemonDetail entity correctly', () {
      // Arrange
      final tSpeciesDto = const PokemonSpeciesDto(
        flavorTextEntries: [
          FlavorTextDto(
            flavorText: 'Line 1\nLine 2\fLine 3',
            language: LanguageDto(name: 'en', url: ''),
          ),
        ],
        genera: [
          GenusDto(
            genus: 'Seed Pokémon',
            language: LanguageDto(name: 'en', url: ''),
          ),
        ],
        genderRate: 1, // 1/8 female = 12.5%
      );

      // Act
      final result = tPokemonDetailDto.toEntity(tSpeciesDto);

      // Assert
      expect(result.id, tPokemonDetailDto.id);
      expect(result.name, tPokemonDetailDto.name);
      expect(result.height, 0.7); // 7 / 10
      expect(result.weight, 6.9); // 69 / 10
      expect(result.description, 'Line 1 Line 2 Line 3'); // Cleaned \n and \f
      expect(result.category, 'Seed'); // Removed ' Pokémon'
      expect(result.femalePercentage, 12.5);
      expect(result.malePercentage, 87.5);
      expect(result.types, ['grass', 'poison']);
      expect(result.ability, 'overgrow');
      expect(result.image, 'url_image');
    });

    test('should use first flavor text if English is not available', () {
      // Arrange
      final tSpeciesDto = const PokemonSpeciesDto(
        flavorTextEntries: [
          FlavorTextDto(
            flavorText: 'Texto en español',
            language: LanguageDto(name: 'es', url: ''),
          ),
        ],
        genera: [],
        genderRate: -1, // Genderless
      );

      // Act
      final result = tPokemonDetailDto.toEntity(tSpeciesDto);

      // Assert
      expect(result.description, 'Texto en español');
      expect(result.femalePercentage, 0.0);
      expect(result.malePercentage, 0.0);
    });

    test('should return empty image if official artwork is missing', () {
      // Arrange
      final tDtoNoImage = tPokemonDetailDto.copyWith(
        sprites: const SpritesDto(other: null),
      );
      final tSpeciesDto = const PokemonSpeciesDto(
        flavorTextEntries: [],
        genera: [],
        genderRate: -1,
      );

      // Act
      final result = tDtoNoImage.toEntity(tSpeciesDto);

      // Assert
      expect(result.image, '');
    });

    test('should handle genderless Pokemon correctly', () {
      // Arrange
      final tSpeciesDto = const PokemonSpeciesDto(
        flavorTextEntries: [],
        genera: [],
        genderRate: -1,
      );

      // Act
      final result = tPokemonDetailDto.toEntity(tSpeciesDto);

      // Assert
      expect(result.femalePercentage, 0.0);
      expect(result.malePercentage, 0.0);
    });
  });
}
