import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoService {
  late final String appVersion;
  late final String androidPackageName;

  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    androidPackageName = packageInfo.packageName;
  }
}
