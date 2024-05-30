import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/core/service_provider.dart';
import 'package:my_flutter_template_application/ui/blocs/factory.dart';
import 'package:my_flutter_template_application/ui/screens/home/home_screen.dart';
import 'package:my_flutter_template_application/ui/screens/splash/splash_screen.dart';

class SplashScreenProvider extends StatelessWidget {
  const SplashScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createSplashScreenBloc(serviceProvider),
      child: const SplashScreen(),
    );
  }
}

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
