import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/di/injection.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/features/admin/home_admin.dart';
import 'package:app_store/core/routing/animation_routing.dart';
import 'package:app_store/features/customer/home_customer.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_store/features/auth/presentation/screens/login_screen.dart';
import 'package:app_store/features/auth/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return AnimationRouting(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return AnimationRouting(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: SignUpScreen(),
          ),
        );

      case Routes.homeAdmin:
        return AnimationRouting(page: HomeAdmin());

      case Routes.homeCustomer:
        return AnimationRouting(page: HomeCustomer());

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
