import 'package:flutter/material.dart';
import 'package:app_store/core/app/env.variables.dart';
import 'package:app_store/core/app/connectivity_controller.dart';
import 'package:app_store/core/common/screens/no_internet_screen.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدمنا ValueListenableBuilder لمراقبة حالة الـ isConnected
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, child) {
        // إذا انقطع الاتصال، نعرض شاشة NoInternetScreen
        if (!isConnected) {
          return MaterialApp(
            title: 'No Internet',
            debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
            home: const NoInternetScreen(),
          );
        }

        // إذا كان الإنترنت متاحاً، نعرض التطبيق الرئيسي
        return MaterialApp(
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
        );
      },
    );
  }
}
