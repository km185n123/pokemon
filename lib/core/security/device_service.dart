import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/// Class to extract unique device identifiers for device binding
class DeviceService {
  final DeviceInfoPlugin _deviceInfo;

  DeviceService({DeviceInfoPlugin? deviceInfo})
    : _deviceInfo = deviceInfo ?? DeviceInfoPlugin();

  /// Returns a unique identifier based on the platform.
  /// Note: The identifier might change upon app reinstall or OS updates on newer OS versions.
  Future<String?> getDeviceIdentifier() async {
    try {
      if (kIsWeb) {
        final webBrowserInfo = await _deviceInfo.webBrowserInfo;
        return webBrowserInfo
            .userAgent; // Not strictly unique, but Web lacks a strong one
      } else if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        // androidId is available but might change upon factory reset
        // Using fingerprint or id as an alternative
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        // identifierForVendor is standard for iOS app tracking
        return iosInfo.identifierForVendor;
      } else if (Platform.isMacOS) {
        final macOsInfo = await _deviceInfo.macOsInfo;
        return macOsInfo.systemGUID;
      } else if (Platform.isWindows) {
        final windowsInfo = await _deviceInfo.windowsInfo;
        return windowsInfo.deviceId;
      } else if (Platform.isLinux) {
        final linuxInfo = await _deviceInfo.linuxInfo;
        return linuxInfo.machineId;
      }
    } catch (e) {
      debugPrint('Failed to get device info: $e');
      return null;
    }
    return null;
  }
}
