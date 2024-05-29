import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSystemConfig {
  const AppSystemConfig({
    this.allowHorizontalOrientation = false,
    this.allowVerticalOrientation = true,
    this.brightness = Brightness.light,
    this.statusBarColor = Colors.transparent,
    this.systemNavigationBarColor = Colors.transparent,
  });

  final bool allowHorizontalOrientation;
  final bool allowVerticalOrientation;
  final Brightness brightness;
  final Color statusBarColor;
  final Color systemNavigationBarColor;
}

void setupSystemConfig({AppSystemConfig config = const AppSystemConfig()}) {
  SystemChrome.setPreferredOrientations([
    if (config.allowHorizontalOrientation) DeviceOrientation.landscapeLeft,
    if (config.allowVerticalOrientation) DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: config.statusBarColor,
      statusBarIconBrightness: config.brightness,
      statusBarBrightness: config.brightness,
      systemNavigationBarColor: config.systemNavigationBarColor,
      systemNavigationBarIconBrightness: config.brightness,
    ),
  );
}
