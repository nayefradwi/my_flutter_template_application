import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_template_application/ui/routing/app_routes.dart';

extension Routing on BuildContext {
  void popUntil<T extends Object?>({
    required String path,
    T? result,
  }) {
    final router = GoRouter.of(this);
    final delegate = router.routerDelegate;
    while (router.canPop()) {
      final lastRoute = delegate.currentConfiguration.last;
      final lastRoutePath = lastRoute.route.path;
      if (lastRoutePath == path) break;
      router.pop<T>(result);
    }
  }

  void popUntilNamed<T extends Object?>({
    required String name,
    T? result,
  }) {
    final router = GoRouter.of(this);
    final delegate = router.routerDelegate;
    while (router.canPop()) {
      final lastRoute = delegate.currentConfiguration.last;
      final lastRouteName = lastRoute.route.name;
      if (lastRouteName == name) break;
      router.pop<T>(result);
    }
  }

  void popUntilSpecificRoute<T extends Object?>({
    required String name,
    required Map<String, String> pathParameters,
    Map<String, String> queryParameters = const {},
    T? result,
  }) {
    final router = GoRouter.of(this);
    final delegate = router.routerDelegate;
    final specificLocation = router.configuration.namedLocation(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
    while (router.canPop()) {
      final lastRoute = delegate.currentConfiguration.last;
      final lastRoutePath = lastRoute.matchedLocation;
      if (lastRoutePath == specificLocation) break;
      router.pop<T>(result);
    }
  }

  void goToHomeScreen() {
    goNamed(AppRouteName.homeScreen);
  }

  void goToForcedUpdateScreen() {
    goNamed(AppRouteName.forcedUpdate);
  }
}
