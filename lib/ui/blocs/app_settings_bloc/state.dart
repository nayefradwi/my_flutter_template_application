import 'package:flutter/material.dart';

class AppSettingsState {
  final Locale locale;
  bool get isArabic => locale.languageCode == 'ar';
  bool get isEnglish => locale.languageCode == 'en';

  AppSettingsState({required this.locale});

  LanguageChangedState languageChanged(Locale locale) {
    return LanguageChangedState(locale);
  }

  AppSettingsState copyWith({Locale? locale}) {
    return AppSettingsState(locale: locale ?? this.locale);
  }
}

class LanguageChangedState extends AppSettingsState {
  LanguageChangedState(Locale locale) : super(locale: locale);
}
