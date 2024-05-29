import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.info('onChange(${bloc.runtimeType}), change: $change');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    logger.info('onCreate(${bloc.runtimeType})');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.error(
      'onError(${bloc.runtimeType}), error: $error',
      error: error,
      stack: stackTrace,
    );
  }
}
