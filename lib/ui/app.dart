import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/core/service_provider.dart';
import 'package:my_flutter_template_application/l10n/l10n.dart';
import 'package:my_flutter_template_application/ui/blocs/app_settings_bloc/bloc.dart';
import 'package:my_flutter_template_application/ui/blocs/app_settings_bloc/state.dart';
import 'package:my_flutter_template_application/ui/blocs/factory.dart';
import 'package:my_flutter_template_application/ui/routing/app_router.dart';
import 'package:my_flutter_template_application/ui/theme/light_theme.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppSettingsBloc appSettingsBloc;

  @override
  void initState() {
    _initiateBlocs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appSettingsBloc),
      ],
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        bloc: appSettingsBloc,
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            theme: appLightTheme,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            locale: state.locale,
          );
        },
      ),
    );
  }

  void _initiateBlocs() {
    appSettingsBloc = createAppSettingsBloc(serviceProvider);
  }

  @override
  void dispose() {
    appSettingsBloc.close();
    super.dispose();
  }
}
