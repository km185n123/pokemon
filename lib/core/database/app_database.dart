import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pokemon/core/database/tables/pokemons_table.dart';
import 'package:pokemon/core/security/key_derivation.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Pokemons])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(pokemons, pokemons.isFavorite);
        }
      },
      beforeOpen: (details) async {
        // ... (can enable foreign keys if needed)
      },
    );
  }

  /// Asynchronously creates and opens the database using the derived encryption key
  static Future<AppDatabase> create(KeyDerivationService keyService) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pokemon_app.sqlite'));

    // Retrieve the derived secure key mapped to this device
    final encryptionKey = await keyService.getDerivedKey();

    final executor = NativeDatabase.createInBackground(
      file,
      setup: (rawDb) {
        // security: enable sqlcipher pragma settings

        // 1. Unlock the database with the derived key
        rawDb.execute("PRAGMA key = '$encryptionKey';");

        // 2. cipher_memory_security: zeroes memory pages after use to prevent
        //    sensitive data from lingering in RAM or being exposed via swap
        rawDb.execute("PRAGMA cipher_memory_security = ON;");

        // 3. cipher_page_size: use 4096 bytes (recommended for SQLCipher 4+)
        rawDb.execute("PRAGMA cipher_page_size = 4096;");

        // 4. kdf_iter: number of PBKDF2 iterations for key derivation (default 256000)
        //    Higher = more secure but slower to open
        rawDb.execute("PRAGMA kdf_iter = 256000;");

        // security: enable db integrity checks

        // 5. Quick integrity check — verifies B-tree structure without decrypting all rows.
        //    If it fails, the DB may be corrupted or the key is wrong.
        final integrityResult = rawDb.select("PRAGMA quick_check;");
        final status = integrityResult.firstOrNull?['quick_check'];
        if (status != 'ok') {
          throw StateError(
            'Database integrity check failed (result: $status). '
            'The database may be corrupted or the encryption key is invalid.',
          );
        }
      },
    );

    return AppDatabase(executor);
  }
}
