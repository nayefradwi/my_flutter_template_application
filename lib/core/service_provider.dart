import 'package:flutter_feature_manager/flutter_feature_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:my_flutter_template_application/core/config.dart';
import 'package:my_flutter_template_application/core/feature_manager.dart';
import 'package:my_flutter_template_application/data/data_sources/http/main_api_client.dart';
import 'package:my_flutter_template_application/data/data_sources/storage/settings_storage.dart';
import 'package:my_flutter_template_application/data/data_sources/storage/token_storage.dart';
import 'package:my_flutter_template_application/data/repos/settings.dart';
import 'package:my_flutter_template_application/domain/services/device_info_service.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

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
  late final _AppRepositories _repos;
  late final DeviceInfoService appDeviceInfoService;
  late final ITokenStorage tokenStorage;
  late final ISettingsStorage settingsStorage;
  late final MainApiClient client;
  FeatureManager featureManager = createFeatureManager();
  bool _hasBeenInitialized = false;
  bool get hasBeenInitialized => _hasBeenInitialized;

  ISettingsRepo get settingsRepo => _repos.settingsRepo;

  ServiceProvider(this.flavor) {
    tokenStorage = TokenStorage(
      const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
          resetOnError: true,
        ),
      ),
    );
    settingsStorage = PreferencesStorage();
    _repos = _AppRepositories.create(
      settingsStorage: settingsStorage,
    );
  }

  Future<void> initialize() async {
    if (_hasBeenInitialized) return;
    await _initializeRuntimeServices();
    _hasBeenInitialized = true;
  }

  Future<void> _initializeRuntimeServices() async {
    await Future.wait<void>([
      settingsStorage.initialize(),
      appDeviceInfoService.init(),
      _initializeFeatureManager(),
    ]);
  }

  Future<void> _initializeFeatureManager() async {
    try {
      await featureManager.initialize();
    } catch (e, stack) {
      logger.error(
        'Error initializing feature manager',
        error: e,
        stack: stack,
      );
    }
  }
}

class _AppRepositories {
  final ISettingsRepo settingsRepo;

  _AppRepositories({
    required this.settingsRepo,
  });

  factory _AppRepositories.create({
    required ISettingsStorage settingsStorage,
  }) {
    return _AppRepositories(
      settingsRepo: SettingsRepo(settingsStorage),
    );
  }
}
