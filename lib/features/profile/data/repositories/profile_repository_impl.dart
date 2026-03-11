import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileRepository {
  Future<bool> getOfflineDbEnabled();
  Future<void> setOfflineDbEnabled(bool enabled);
}

class ProfileRepositoryImpl implements ProfileRepository {
  static const String _offlineDbKey = 'offline_db_enabled';
  final SharedPreferences sharedPreferences;

  ProfileRepositoryImpl(this.sharedPreferences);

  @override
  Future<bool> getOfflineDbEnabled() async {
    // Defaults to true if it hasn't been set
    return sharedPreferences.getBool(_offlineDbKey) ?? true;
  }

  @override
  Future<void> setOfflineDbEnabled(bool enabled) async {
    await sharedPreferences.setBool(_offlineDbKey, enabled);
  }
}
