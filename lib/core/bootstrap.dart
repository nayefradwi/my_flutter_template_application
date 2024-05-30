import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/core/core.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  registerFlavor();
  registerServiceProvider(flavor);
  await setupPlugins();
  setupListeners(flavor);
  setupSystemConfig();
  // TODO: add feature manager here if it depends on any of the plugins
  // serviceProvider.featureManager = createFeatureManager();
  return runApp(await builder());
}

void setupListeners(Flavor flavor) {
  Logger.level =
      flavor.isProd && !kDebugMode ? AppLogType.error : AppLogType.debug;
  Logger.listen = _onLoggingRecord;
  FlutterError.onError = (details) {
    logger.error(
      details.exceptionAsString(),
      error: details.exception,
      stack: details.stack,
    );
  };
  Bloc.observer = const AppBlocObserver();
}

void _onLoggingRecord(AppLog log) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(log.toString()).forEach((match) {
    if (kDebugMode) print(match.group(0));
  });
  // you can do more here incase you wanna report the bugs or something
}

Future<void> setupPlugins() async {
  // TODO: you can set up things like firebase here
}
