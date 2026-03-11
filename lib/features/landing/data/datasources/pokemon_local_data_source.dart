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

  Future<void> addFavorite(Pokemon pokemon);
  Future<void> deleteFavorite(Pokemon pokemon);
  Future<List<Pokemon>> getFavoritePokemons();
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
        isFavorite: row.isFavorite,
      );
    }).toList();
  }

  @override
  Future<void> cachePokemons(List<Pokemon> pokemons) async {
    await _database.batch((batch) {
      for (final pokemon in pokemons) {
        batch.insert(
          _database.pokemons,
          PokemonsCompanion.insert(
            id: Value(pokemon.id),
            name: pokemon.name,
            image: Value(pokemon.image),
            types: Value(pokemon.types.join(',')),
            // Do not override isFavorite unless specified
            isFavorite: const Value.absent(),
          ),
          onConflict: DoUpdate(
            (old) => PokemonsCompanion.custom(
              name: Constant(pokemon.name),
              image: Constant(pokemon.image),
              types: Constant(pokemon.types.join(',')),
            ),
            target: [_database.pokemons.id],
          ),
        );
      }
    });
  }

  @override
  Future<void> clearCache() async {
    // Only delete non-favorites when clearing cache to avoid losing user data.
    // If we want complete clear, we delete all. But currently the app doesn't call clearCache()
    await _database.delete(_database.pokemons).go();
  }

  @override
  Future<void> addFavorite(Pokemon pokemon) async {
    await (_database.update(_database.pokemons)
          ..where((t) => t.id.equals(pokemon.id)))
        .write(const PokemonsCompanion(isFavorite: Value(true)));
  }

  @override
  Future<void> deleteFavorite(Pokemon pokemon) async {
    await (_database.update(_database.pokemons)
          ..where((t) => t.id.equals(pokemon.id)))
        .write(const PokemonsCompanion(isFavorite: Value(false)));
  }

  @override
  Future<List<Pokemon>> getFavoritePokemons() async {
    final rows = await (_database.select(
      _database.pokemons,
    )..where((t) => t.isFavorite.equals(true))).get();

    return rows.map((row) {
      final types = row.types.isNotEmpty ? row.types.split(',') : <String>[];

      return Pokemon(
        id: row.id,
        name: row.name,
        image: row.image ?? '',
        types: types,
        isFavorite: row.isFavorite,
      );
    }).toList();
  }
}
