import 'package:flutter/material.dart';
import 'package:app_store/core/app/env.variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/app/connectivity_controller.dart';
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

        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            title: 'Store App',
            debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Store App"),
              ),
              body: const Center(
                child: Text('Welcome to Store App!'),
              ),
            ),
          ),
        );
      },
    );
  }
}
