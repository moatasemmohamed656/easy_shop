import 'package:flutter/material.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/core/routing/animation_routing.dart';
import 'package:app_store/features/auth/presentation/screens/login_screen.dart';
import 'package:app_store/features/auth/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return AnimationRouting(page: LoginScreen());

        case Routes.signUpScreen:
        return AnimationRouting(page: SignUpScreen());
        


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
