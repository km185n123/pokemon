// lib/features/pokemon/data/datasources/pokemon_local_data_source.dart

import 'package:drift/drift.dart';
import 'package:pokemon/core/database/app_database.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart'
    as domain;

abstract class PokemonLocalDataSource {
  Future<List<domain.Pokemon>> getCachedPokemons();
  Future<void> cachePokemons(List<domain.Pokemon> pokemons);
  Future<void> clearCache();
}

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final AppDatabase _db;

  PokemonLocalDataSourceImpl({required AppDatabase database}) : _db = database;

  @override
  Future<List<domain.Pokemon>> getCachedPokemons() async {
    final rows = await _db.select(_db.pokemons).get();
    return rows.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> cachePokemons(List<domain.Pokemon> pokemons) async {
    await _db.batch((batch) {
      for (final pokemon in pokemons) {
        batch.insert(
          _db.pokemons,
          pokemon.toCompanion(),
          onConflict: DoUpdate(
            (_) => pokemon.toUpdateCompanion(),
            target: [_db.pokemons.id],
          ),
        );
      }
    });
  }

  @override
  Future<void> clearCache() async {
    await (_db.delete(
      _db.pokemons,
    )..where((tbl) => tbl.isFavorite.equals(false))).go();
  }
}

/* -------------------------------------------------------------------------- */
/*                                  MAPPERS                                   */
/* -------------------------------------------------------------------------- */

extension PokemonDriftMapper on PokemonEntity {
  domain.Pokemon toDomain() {
    return domain.Pokemon(
      id: id,
      name: name,
      image: image ?? '',
      types: types.isEmpty ? [] : types.split(','),
      isFavorite: isFavorite,
    );
  }
}

extension PokemonEntityMapper on domain.Pokemon {
  PokemonsCompanion toCompanion() {
    return PokemonsCompanion.insert(
      id: Value(id),
      name: name,
      image: Value(image),
      types: Value(types.join(',')),
      isFavorite: Value(isFavorite),
    );
  }

  PokemonsCompanion toUpdateCompanion() {
    return PokemonsCompanion(
      name: Value(name),
      image: Value(image),
      types: Value(types.join(',')),
      isFavorite: Value(isFavorite),
    );
  }
}
