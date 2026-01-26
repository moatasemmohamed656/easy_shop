import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_store/store_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_store/core/app/bloc_observer.dart';
import 'package:app_store/core/app/env.variables.dart';
import 'package:app_store/core/app/connectivity_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment variables
  await EnvVariables.instance.init(
    envType: EnvTypeEnum.dev,
  );
     // Bloc Observer
  Bloc.observer = AppBlocObserver();

  // Initialize connectivity controller
  await ConnectivityController.instance.init();

  // Initialize Firebase
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyD1jy8Qy5Jmi3XZQUy2CvYDvA5NF7I8qRU",
          appId: '1:212579227838:android:ade93788bd565b773666ef',
          messagingSenderId: '212579227838',
          projectId: 'easyshop-1c2e4',
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    print('Firebase initialization error: $e');
  }

  // Force portrait orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    // Run the app
    runApp(const StoreApp());
  });
}
