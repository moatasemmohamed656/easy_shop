import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/di/injection.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/core/app/env.variables.dart';
import 'package:app_store/core/routing/app_router.dart';
import 'package:app_store/core/style/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/app/app_cubit/app_cubit.dart';
import 'package:app_store/core/app/connectivity_controller.dart';
import 'package:app_store/core/services/shared_pref/pref_keys.dart';
import 'package:app_store/core/services/shared_pref/shared_pref.dart';
import 'package:app_store/core/language/app_localizations_setup.dart';
import 'package:app_store/core/common/screens/no_internet_screen.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, child) {
        if (!isConnected) {
          return MaterialApp(
            title: 'No Internet',
            debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
            home: const NoInternetScreen(),
          );
        }
        return BlocProvider<AppCubit>(
          create: (context) => sl<AppCubit>()
            ..changeAppThemeMode(
              sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
            )
            ..getSavedLanguage(),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                final cubit = context.read<AppCubit>();
                print(
                  '[DEBUG] Current theme: ${cubit.isDark ? "Dark" : "Light"}',
                );
                print('[DEBUG] Current language: ${cubit.currentLangCode}');
                return MaterialApp(
                  onGenerateRoute: AppRouter.onGenerateRoute,
                  initialRoute:
                      SharedPref().getString(PrefKeys.accessToken) != null
                      ? SharedPref().getString(PrefKeys.role) == 'admin'
                            ? Routes.homeAdmin
                            : Routes.homeCustomer
                      : Routes.loginScreen,
                  title: 'Store App',
                  debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
                  theme: cubit.isDark ? themeDark() : themeLight(),
                  locale: Locale(cubit.currentLangCode),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
