import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const _languageKey = 'language';

mixin ISettingsStorage {
  Future<void> initialize();
  Future<bool> setPreferredLanguage(String language);
  String getPreferredLanguage();
}

class PreferencesStorage implements ISettingsStorage {
  late final SharedPreferences _sharedPreferences;

  PreferencesStorage();

  @override
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setPreferredLanguage(String language) {
    return _sharedPreferences.setString(_languageKey, language);
  }

  @override
  String getPreferredLanguage() {
    return _sharedPreferences.getString(_languageKey) ?? 'en';
  }
}
