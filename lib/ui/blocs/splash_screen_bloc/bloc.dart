import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/core/config.dart';
import 'package:my_flutter_template_application/core/feature_manager.dart';
import 'package:my_flutter_template_application/core/service_provider.dart';
import 'package:my_flutter_template_application/domain/domain.dart';
import 'package:my_flutter_template_application/ui/blocs/splash_screen_bloc/state.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

class SplashScreenBloc extends Cubit<SplashScreenState> {
  final HasUpdateUseCase hasUpdateUseCase;
  final GetLanguageUseCase getLanguageUseCase;
  final ServiceProvider provider;
  SplashScreenBloc({
    required this.provider,
    required this.hasUpdateUseCase,
    required this.getLanguageUseCase,
  }) : super(SplashScreenState());

  Future<void> initialize() async {
    try {
      await provider.initialize();
      _initializeLanguage();
      _checkForForcedUpdate();
    } catch (e, s) {
      logger.error('initialize service provider error', error: e, stack: s);
      // TODO: you can do something else when this fails
    }
  }

  void _initializeLanguage() {
    final result = getLanguageUseCase.call();
    final languageCode = result.tryGetData() ?? 'en';
    currentLang = languageCode;
    emit(state.initializedState(languageCode));
  }

  void _checkForForcedUpdate() {
    final currentVersion = serviceProvider.appDeviceInfoService.appVersion;
    final remoteVersion = serviceProvider.featureManager
        .getFeature<String>(
          defaultLatestAppVersionFeature.key,
          defaultValue: defaultLatestAppVersionFeature.value,
        )
        .value;
    final result = hasUpdateUseCase.call(
      param: HasUpdateInput(
        currentVersion: currentVersion,
        remoteVersion: remoteVersion,
      ),
    );
    if (result.tryGetData() ?? false) return emit(state.forceUpdate());
    emit(state.goToHome());
  }
}
