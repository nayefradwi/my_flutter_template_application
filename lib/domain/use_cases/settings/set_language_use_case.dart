import 'package:my_flutter_template_application/core/config.dart';
import 'package:my_flutter_template_application/data/repos/settings.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

class SetLanguageUseCase with IUseCase<void, String> {
  final ISettingsRepo _settingsRepository;

  SetLanguageUseCase(this._settingsRepository);

  @override
  Result<void> execute(String param) {
    currentLang = param;
    _settingsRepository.setPreferredLanguage(param);
    return Result.success(null);
  }
}
