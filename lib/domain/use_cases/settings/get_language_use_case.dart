import 'package:my_flutter_template_application/data/repos/settings.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

class GetLanguageUseCase with IUseCase<String, void> {
  final ISettingsRepo _settingsRepository;

  GetLanguageUseCase(this._settingsRepository);

  @override
  Result<String> call({void param}) {
    return super.call(param: null);
  }

  @override
  Result<String> execute(void param) {
    return _settingsRepository.getPreferredLanguage();
  }
}
