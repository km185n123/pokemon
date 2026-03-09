import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pokemon/core/database/tables/pokemons_table.dart';
import 'package:pokemon/core/security/key_derivation.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Pokemons])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  /// Asynchronously creates and opens the database using the derived encryption key
  static Future<AppDatabase> create(KeyDerivationService keyService) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pokemon_app.sqlite'));

    // Retrieve the derived secure key mapped to this device
    final encryptionKey = await keyService.getDerivedKey();

    final executor = NativeDatabase.createInBackground(
      file,
      setup: (rawDb) {
        // Use PRAGMA key to encrypt/decrypt the database via sqlcipher
        rawDb.execute("PRAGMA key = '$encryptionKey';");
      },
    );

    return AppDatabase(executor);
  }
}
