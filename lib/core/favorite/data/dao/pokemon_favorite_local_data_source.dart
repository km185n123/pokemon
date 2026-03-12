import 'package:drift/drift.dart';
import 'package:pokemon/core/database/app_database.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

abstract class PokemonFavoriteLocalDataSource {
  Future<void> addFavorite(Pokemon pokemon);
  Future<void> deleteFavorite(Pokemon pokemon);
  Future<List<Pokemon>> getFavoritePokemons();
}

class PokemonFavoriteLocalDataSourceImpl
    implements PokemonFavoriteLocalDataSource {
  final AppDatabase _database;

  PokemonFavoriteLocalDataSourceImpl({required AppDatabase database})
    : _database = database;

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
