import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/ui/blocs/app_settings_bloc/bloc.dart';
import 'package:my_flutter_template_application/ui/blocs/splash_screen_bloc/bloc.dart';

extension BlocContextExtension on BuildContext {
  AppSettingsBloc get appSettingsBloc => read<AppSettingsBloc>();
  SplashScreenBloc get splashScreenBloc => read<SplashScreenBloc>();
}
