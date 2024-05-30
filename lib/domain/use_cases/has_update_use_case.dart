import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

class HasUpdateInput {
  const HasUpdateInput({
    required this.currentVersion,
    required this.remoteVersion,
  });
  final String currentVersion;
  final String remoteVersion;
}

class HasUpdateUseCase with IUseCase<bool, HasUpdateInput> {
  @override
  Result<bool> execute(HasUpdateInput param) {
    final isForcedUpdate = isRemoteVersionGreater(
      remoteVersion: param.remoteVersion,
      currentVersion: param.currentVersion,
    );
    return Result.success(isForcedUpdate);
  }

  /// Returns true if [remoteVersion] is greater than [currentVersion]
  bool isRemoteVersionGreater({
    required String remoteVersion,
    required String currentVersion,
  }) {
    if (remoteVersion == currentVersion) return false;
    final biggerVersion = compareVersions(
      version1: remoteVersion,
      version2: currentVersion,
    );
    return biggerVersion == remoteVersion;
  }

  /// Returns the bigger version number from [version1] and [version2]
  String compareVersions({
    required String version1,
    required String version2,
  }) {
    try {
      final version1Parts = version1.split('.').map(int.parse).toList();
      final version2Parts = version2.split('.').map(int.parse).toList();
      if (version1Parts.first > version2Parts.first) {
        return version1;
      }
      if (version1Parts[1] > version2Parts[1] &&
          version1Parts.first == version2Parts.first) {
        return version1;
      }
      if (version1Parts.last > version2Parts.last &&
          version1Parts[1] == version2Parts[1] &&
          version1Parts.first == version2Parts.first) {
        return version1;
      }
      return version2;
    } catch (_) {
      logger.warning('Invalid version number');
      return version2;
    }
  }
}
