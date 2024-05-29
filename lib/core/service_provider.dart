import 'package:get_it/get_it.dart';
import 'package:my_flutter_template_application/core/config.dart';

ServiceProvider get serviceProvider => GetIt.I.get<ServiceProvider>();

void refreshServiceProvider(Flavor flavor) {
  GetIt.I.unregister<ServiceProvider>();
  GetIt.I.registerSingleton<ServiceProvider>(ServiceProvider(flavor));
}

void registerServiceProvider(Flavor flavor) {
  GetIt.I.registerSingleton<ServiceProvider>(ServiceProvider(flavor));
}

class ServiceProvider {
  final Flavor flavor;
  bool _hasBeenInitialized = false;
  bool get hasBeenInitialized => _hasBeenInitialized;
  ServiceProvider(this.flavor);
}

class _AppRepositories {}
