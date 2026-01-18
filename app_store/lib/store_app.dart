import 'package:flutter/material.dart';
import 'package:app_store/core/app/env.variables.dart';



class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Store App"),
        ),
      )
    );
  }
}
