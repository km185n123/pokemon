import 'package:drift/drift.dart';

@DataClassName('PokemonEntity')
class Pokemons extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text().nullable()();
  // types stored as comma-separated string, e.g. "fire,water"
  TextColumn get types => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}
