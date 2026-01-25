import 'package:flutter/material.dart';
import 'package:app_store/test_two.dart';
import 'package:app_store/test_one.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/core/routing/animation_routing.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.testOne:
        return AnimationRouting(page: TestOne());

      case Routes.testtwo:
        return AnimationRouting(page: TestTwo());

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
