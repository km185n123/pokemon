import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_list_response_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_species_dto.dart';

void main() {
  group('DTO Serialization/Deserialization', () {
    group('PokemonListResponseDto', () {
      final json = {
        'count': 123,
        'next': 'next_url',
        'previous': null,
        'results': [
          {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
        ],
      };

      test('should deserialize from JSON', () {
        final result = PokemonListResponseDto.fromJson(json);

        expect(result.count, 123);
        expect(result.next, 'next_url');
        expect(result.results.length, 1);
        expect(result.results.first.name, 'bulbasaur');
      });

      test('should serialize to JSON', () {
        final dto = PokemonListResponseDto.fromJson(json);

        expect(dto.count, 123);
        expect(dto.next, 'next_url');
        expect(dto.results.first.name, 'bulbasaur');
      });
    });

    group('PokemonDetailDto', () {
      final json = {
        'id': 1,
        'name': 'bulbasaur',
        'height': 7,
        'weight': 69,
        'types': [
          {
            'type': {'name': 'grass', 'url': ''},
          },
        ],
        'sprites': {
          'front_default': 'url',
          'other': {
            'official-artwork': {'front_default': 'official_url'},
          },
        },
        'abilities': [
          {
            'ability': {'name': 'overgrow', 'url': ''},
          },
        ],
      };

      test('should deserialize from JSON', () {
        final result = PokemonDetailDto.fromJson(json);

        expect(result.id, 1);
        expect(result.name, 'bulbasaur');
        expect(result.height, 7);
        expect(result.sprites.frontDefault, 'url');
        expect(
          result.sprites.other?.officialArtwork?.frontDefault,
          'official_url',
        );
      });

      test('should serialize to JSON', () {
        final dto = PokemonDetailDto.fromJson(json);
        final resultJson = dto.toJson();

        expect(resultJson['id'], 1);
        expect(resultJson['name'], 'bulbasaur');
      });
    });

    group('PokemonSpeciesDto', () {
      final json = {
        'flavor_text_entries': [
          {
            'flavor_text': 'test text',
            'language': {'name': 'en', 'url': ''},
          },
        ],
        'genera': [
          {
            'genus': 'test genus',
            'language': {'name': 'en', 'url': ''},
          },
        ],
        'gender_rate': 1,
      };

      test('should deserialize from JSON', () {
        final result = PokemonSpeciesDto.fromJson(json);

        expect(result.genderRate, 1);
        expect(result.flavorTextEntries.first.flavorText, 'test text');
      });

      test('should serialize to JSON', () {
        final dto = PokemonSpeciesDto.fromJson(json);
        final resultJson = dto.toJson();

        expect(resultJson['gender_rate'], 1);
      });
    });
  });
}
