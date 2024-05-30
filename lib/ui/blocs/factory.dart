import 'package:my_flutter_template_application/core/service_provider.dart';
import 'package:my_flutter_template_application/domain/domain.dart';
import 'package:my_flutter_template_application/ui/blocs/app_settings_bloc/bloc.dart';
import 'package:my_flutter_template_application/ui/blocs/splash_screen_bloc/bloc.dart';

AppSettingsBloc createAppSettingsBloc(ServiceProvider serviceProvider) {
  return AppSettingsBloc(
    getLanguageUseCase: GetLanguageUseCase(serviceProvider.settingsRepo),
    setLanguageUseCase: SetLanguageUseCase(serviceProvider.settingsRepo),
  );
}

SplashScreenBloc createSplashScreenBloc(ServiceProvider serviceProvider) {
  return SplashScreenBloc(
    provider: serviceProvider,
    hasUpdateUseCase: HasUpdateUseCase(),
    getLanguageUseCase: GetLanguageUseCase(serviceProvider.settingsRepo),
  );
}
