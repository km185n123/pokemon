import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service responsible for generating and retrieving the secure encryption key
/// used for the local database (e.g., drift with sqlcipher).
/// It stores the key securely in the platform's Keystore (Android) or Keychain (iOS).
class SecureKeyService {
  final FlutterSecureStorage _secureStorage;

  static const String _encryptionKeyName = 'db_encryption_key';

  const SecureKeyService({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  /// Retrieves the existing encryption key or generates a new one if it doesn't exist.
  Future<String> getDbEncryptionKey() async {
    final existingKey = await _secureStorage.read(key: _encryptionKeyName);

    if (existingKey != null) {
      return existingKey;
    }

    // Generate a secure random key if it doesn't exist
    final newKey = _generateSecureRandomKey();

    // Save it safely to Keystore / Keychain
    await _secureStorage.write(key: _encryptionKeyName, value: newKey);

    return newKey;
  }

  /// Generates a cryptographically secure 256-bit key (32 bytes) encoded in Base64
  String _generateSecureRandomKey() {
    final random = Random.secure();
    final values = List<int>.generate(32, (i) => random.nextInt(256));
    return base64UrlEncode(values);
  }

  /// (Optional) Use this only if you need to rotate keys or clear storage during testing
  Future<void> clearEncryptionKey() async {
    await _secureStorage.delete(key: _encryptionKeyName);
  }
}
