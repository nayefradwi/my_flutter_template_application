import 'package:get_it/get_it.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

String currentLang = 'en';
const _appFlavor = String.fromEnvironment('FLAVOR');
const templateExample = String.fromEnvironment('TEMPLATE_EXAMPLE');

Flavor get flavor => GetIt.I<Flavor>();

enum Flavor {
  dev,
  prod,
  staging;

  bool get isDev => this == Flavor.dev;
  bool get isProd => this == Flavor.prod;
  bool get isStaging => this == Flavor.staging;

  factory Flavor.fromString(String flavor) {
    return switch (flavor) {
      'dev' => Flavor.dev,
      'prod' => Flavor.prod,
      'staging' => Flavor.staging,
      _ => throw Exception('Flavor $flavor not found'),
    };
  }
}

void registerFlavor() {
  try {
    final flavor = Flavor.fromString(_appFlavor);
    GetIt.I.registerSingleton<Flavor>(flavor);
  } catch (e, stack) {
    logger.error('Error registering flavor $e', error: e, stack: stack);
  }
}
