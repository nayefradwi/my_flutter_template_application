import 'package:my_flutter_template_application/data/data_sources/storage/settings_storage.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

mixin ISettingsRepo {
  FutureResult<void> setPreferredLanguage(String language);
  Result<String> getPreferredLanguage();
}

class SettingsRepo with ISettingsRepo {
  final ISettingsStorage _storage;

  SettingsRepo(this._storage);
  @override
  Result<String> getPreferredLanguage() {
    try {
      return Result.success(_storage.getPreferredLanguage());
    } catch (e) {
      logger.error(e.toString(), error: e);
      return Result.success('en');
    }
  }

  @override
  FutureResult<void> setPreferredLanguage(String language) async {
    try {
      final isSuccess = await _storage.setPreferredLanguage(language);
      if (!isSuccess) throw Exception('Failed to set preferred language');
      return Result.success(null);
    } catch (e) {
      logger.error(e.toString(), error: e);
      return Result.exception('Failed to set preferred language');
    }
  }
}
