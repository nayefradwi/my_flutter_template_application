import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
    AppLocalizations.localizationsDelegates;

List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
