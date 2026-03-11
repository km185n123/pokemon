import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferencesService {
  final SharedPreferences _prefs;

  LocalPreferencesService(this._prefs);

  static const _hasSeenTutorialKey = 'has_seen_tutorial';

  bool get hasSeenTutorial => _prefs.getBool(_hasSeenTutorialKey) ?? false;

  Future<void> setHasSeenTutorial(bool value) async {
    await _prefs.setBool(_hasSeenTutorialKey, value);
  }
}
