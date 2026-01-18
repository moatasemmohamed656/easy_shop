import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_store/store_app.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid || Platform.isIOS
      ? await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyD1jy8Qy5Jmi3XZQUy2CvYDvA5NF7I8qRU",
          appId: '1:212579227838:android:ade93788bd565b773666ef',
          messagingSenderId: '212579227838',
          projectId: 'easyshop-1c2e4', 
      ))
      : await Firebase.initializeApp();

  await Firebase.initializeApp();


  runApp(const StoreApp());
}

