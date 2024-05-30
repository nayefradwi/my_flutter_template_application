import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/ui/blocs/splash_screen_bloc/bloc.dart';
import 'package:my_flutter_template_application/ui/blocs/splash_screen_bloc/state.dart';
import 'package:my_flutter_template_application/ui/extensions/blocs.dart';
import 'package:my_flutter_template_application/ui/extensions/routing.dart';
import 'package:nayef_common_widgets/nayef_common_widgets.dart';

// TODO customiz this screen as you want
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.splashScreenBloc.initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      resizeToAvoidBottomInset: false,
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: _splashScreenListener,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _splashScreenListener(BuildContext context, SplashScreenState state) {
    if (state is LanguageInitializedState) {
      context.appSettingsBloc.setInitialLanguage(state.languageCode);
    }
    if (state.isInitial) return;
    _handleSplashScreenResultState(context, state);
  }

  void _handleSplashScreenResultState(
    BuildContext context,
    SplashScreenState state,
  ) {
    return switch (state.runtimeType) {
      GoToHomeState => context.goToHomeScreen(),
      ForceUpdateState => context.goToForcedUpdateScreen(),
      _ => null,
    };
  }
}
