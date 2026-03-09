import 'package:drift/drift.dart';
import 'package:pokemon/core/database/app_database.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

/// Interface for the local data source caching [Pokemon] entities.
abstract class PokemonLocalDataSource {
  /// Fetches a list of cached [Pokemon]s from the local database.
  Future<List<Pokemon>> getCachedPokemons();

  /// Saves a list of [Pokemon]s into the local database.
  Future<void> cachePokemons(List<Pokemon> pokemons);

  /// Clears all cached [Pokemon]s from the local database.
  Future<void> clearCache();
}

/// Concrete Drift implementation of [PokemonLocalDataSource].
class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final AppDatabase _database;

  PokemonLocalDataSourceImpl({required AppDatabase database})
    : _database = database;

  @override
  Future<List<Pokemon>> getCachedPokemons() async {
    final rows = await _database.select(_database.pokemons).get();

    return rows.map((row) {
      final types = row.types.isNotEmpty ? row.types.split(',') : <String>[];

      return Pokemon(
        id: row.id,
        name: row.name,
        image: row.image ?? '',
        types: types,
      );
    }).toList();
  }

  @override
  Future<void> cachePokemons(List<Pokemon> pokemons) async {
    await _database.batch((batch) {
      batch.insertAll(
        _database.pokemons,
        pokemons.map(
          (pokemon) => PokemonsCompanion.insert(
            id: Value(pokemon.id),
            name: pokemon.name,
            image: Value(pokemon.image),
            types: Value(pokemon.types.join(',')),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<void> clearCache() async {
    await _database.delete(_database.pokemons).go();
  }
}
