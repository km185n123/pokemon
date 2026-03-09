import 'package:drift/drift.dart';

@DataClassName('PokemonEntity')
class Pokemons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get url => text()();
  TextColumn get imageUrl => text().nullable()();
  
  // Example fields, can add more depending on API response later
  // TextColumn get types => text().nullable()(); // Stored as comma separated string or JSON if complex
}
