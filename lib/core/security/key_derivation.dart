import 'package:pokemon/core/security/device_service.dart';
import 'package:pokemon/core/security/encryption_service.dart';
import 'package:pokemon/core/security/secure_key_service.dart';

/// Service responsible for combining the securely stored encryption key
/// and the unique device identifier to derive a final encryption key using SHA-256.
/// This ensures the database is bound to both the device and the keystore.
class KeyDerivationService {
  final SecureKeyService _secureKeyService;
  final DeviceService _deviceService;

  const KeyDerivationService({
    required SecureKeyService secureKeyService,
    required DeviceService deviceService,
  }) : _secureKeyService = secureKeyService,
       _deviceService = deviceService;

  /// Retrieves the final derived encryption key.
  /// It combines the device ID and the secure key, then hashes them with SHA-256
  /// to generate a consistent, secure 256-bit key for SQLCipher.
  Future<String> getDerivedKey() async {
    final secureKey = await _secureKeyService.getDbEncryptionKey();
    final deviceId =
        await _deviceService.getDeviceIdentifier() ?? 'fallback-device-id';

    // Combine both strings safely
    final combinedString = '$secureKey-$deviceId';

    // Hash the combined string using SHA-256 (provided by EncryptionService)
    final derivedHash = EncryptionService.generateSha256Hash(combinedString);

    return derivedHash;
  }
}
