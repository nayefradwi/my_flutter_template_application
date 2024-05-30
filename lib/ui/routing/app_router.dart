import 'package:go_router/go_router.dart';
import 'package:my_flutter_template_application/ui/routing/app_routes.dart';
import 'package:my_flutter_template_application/ui/routing/screen_providers.dart';
import 'package:my_flutter_template_application/ui/screens/forced_update/forced_update_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutePath.splashScreen,
  errorBuilder: (context, state) => const HomeScreenProvider(),
  routes: [
    SplashScreenRoute(),
    ForcedUpdateScreenRoute(),
    HomeScreenRoute(),
  ],
);

class SplashScreenRoute extends GoRoute {
  SplashScreenRoute()
      : super(
          path: AppRoutePath.splashScreen,
          name: AppRouteName.splashScreen,
          builder: (context, state) => const SplashScreenProvider(),
        );
}

class ForcedUpdateScreenRoute extends GoRoute {
  ForcedUpdateScreenRoute()
      : super(
          path: AppRoutePath.forcedUpdate,
          name: AppRouteName.forcedUpdate,
          builder: (context, state) => const ForcedUpdateScreen(),
        );
}

class HomeScreenRoute extends GoRoute {
  HomeScreenRoute()
      : super(
          path: AppRoutePath.homeScreen,
          name: AppRouteName.homeScreen,
          builder: (context, state) => const HomeScreenProvider(),
          routes: [],
        );
}
