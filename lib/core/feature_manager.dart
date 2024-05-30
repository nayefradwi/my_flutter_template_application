import 'dart:async';

import 'package:flutter_feature_manager/flutter_feature_manager.dart';

final defaultLatestAppVersionFeature = Feature<String>(
  key: 'latest_app_version',
  value: '0.0.1',
);

class _EmptyRemoteDataSource with IRemoteDataSource {
  @override
  Future<void> initialize() async {}

  @override
  String get key => 'empty';

  @override
  FutureOr<Map<String, Feature<dynamic>>> loadFeatures() => {};
}

OverridableFeatureManager createFeatureManager() {
  return OverridableFeatureManager(
    remoteDataSource: _EmptyRemoteDataSource(),
    defaultsDataSource: DefaultsDataSource(
      defaultFeatures: {
        defaultLatestAppVersionFeature.key: defaultLatestAppVersionFeature,
      },
    ),
  );
}
