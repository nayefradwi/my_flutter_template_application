import 'package:my_flutter_template_application/core/service_provider.dart';
import 'package:my_flutter_template_application/domain/use_cases/settings/get_language_use_case.dart';
import 'package:my_flutter_template_application/domain/use_cases/settings/set_language_use_case.dart';
import 'package:my_flutter_template_application/ui/blocs/app_settings_bloc/bloc.dart';

AppSettingsBloc createAppSettingsBloc(ServiceProvider serviceProvider) {
  return AppSettingsBloc(
    getLanguageUseCase: GetLanguageUseCase(serviceProvider.settingsRepo),
    setLanguageUseCase: SetLanguageUseCase(serviceProvider.settingsRepo),
  );
}
