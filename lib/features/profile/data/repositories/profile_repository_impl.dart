import 'package:pokemon/core/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileRepository {
  Future<bool> getOfflineDbEnabled();
  Future<void> setOfflineDbEnabled(bool enabled);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final SharedPreferences sharedPreferences;

  ProfileRepositoryImpl(this.sharedPreferences);

  @override
  Future<bool> getOfflineDbEnabled() async {
    return sharedPreferences.getBool(Constants.offlineDbKey) ?? true;
  }

  @override
  Future<void> setOfflineDbEnabled(bool enabled) async {
    await sharedPreferences.setBool(Constants.offlineDbKey, enabled);
  }
}
