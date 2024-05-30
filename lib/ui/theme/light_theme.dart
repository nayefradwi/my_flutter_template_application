import 'package:flutter/material.dart';
import 'package:my_flutter_template_application/ui/theme/main_theme.dart';

const lightColorScheme = ColorScheme.light();

// TODO: customize the light theme to your liking
final appLightTheme = appMainTheme.copyWith(
  colorScheme: lightColorScheme,
  unselectedWidgetColor: lightColorScheme.surface,
  textTheme: appMainTheme.textTheme.apply(
    displayColor: lightColorScheme.onSurface,
    bodyColor: lightColorScheme.onSurface,
    decorationColor: lightColorScheme.onSurface,
    decorationStyle: TextDecorationStyle.solid,
  ),
  appBarTheme: appMainTheme.appBarTheme.copyWith(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: lightColorScheme.onSurface,
    surfaceTintColor: Colors.transparent,
  ),
);
