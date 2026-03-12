import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/core/database/app_database.dart';
import 'package:pokemon/features/landing/data/datasources/pokemon_local_data_source.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart'
    as domain;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();

  late AppDatabase database;
  late PokemonLocalDataSourceImpl dataSource;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    dataSource = PokemonLocalDataSourceImpl(database: database);
  });

  tearDown(() async {
    await database.close();
  });

  final tPokemon = const domain.Pokemon(
    id: 1,
    name: 'bulbasaur',
    image: 'url_image',
    types: ['grass', 'poison'],
    isFavorite: false,
  );

  group('cachePokemons', () {
    test('should insert pokemons into database', () async {
      // Arrange
      final pokemons = [tPokemon];

      // Act
      await dataSource.cachePokemons(pokemons);

      // Assert
      final result = await dataSource.getCachedPokemons();
      expect(result, contains(tPokemon));
    });

    test('should update existing pokemon on conflict', () async {
      // Arrange
      await dataSource.cachePokemons([tPokemon]);
      final updatedPokemon = tPokemon.copyWith(name: 'bulbasaur_updated');

      // Act
      await dataSource.cachePokemons([updatedPokemon]);

      // Assert
      final result = await dataSource.getCachedPokemons();
      expect(result.first.name, 'bulbasaur_updated');
      expect(result.length, 1);
    });
  });

  group('getCachedPokemons', () {
    test('should return empty list when no pokemons are cached', () async {
      // Act
      final result = await dataSource.getCachedPokemons();

      // Assert
      expect(result, isEmpty);
    });

    test('should return list of cached pokemons', () async {
      // Arrange
      await dataSource.cachePokemons([tPokemon]);

      // Act
      final result = await dataSource.getCachedPokemons();

      // Assert
      expect(result, equals([tPokemon]));
    });
  });

  group('clearCache', () {
    test('should delete non-favorite pokemons but keep favorites', () async {
      // Arrange
      final favoritePokemon = tPokemon.copyWith(id: 2, isFavorite: true);
      await dataSource.cachePokemons([tPokemon, favoritePokemon]);

      // Act
      await dataSource.clearCache();

      // Assert
      final result = await dataSource.getCachedPokemons();
      expect(result, contains(favoritePokemon));
      expect(result, isNot(contains(tPokemon)));
      expect(result.length, 1);
    });
  });
}
