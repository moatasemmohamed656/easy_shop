import 'package:flutter/material.dart';
import 'package:app_store/core/routing/routes.dart';



class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.testOne:
      //   return AnimationRouting(page: TestOne());

      // case Routes.testtwo:
      //   return AnimationRouting(page: TestTwo());

      default:
        return MaterialPageRoute<void>(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
