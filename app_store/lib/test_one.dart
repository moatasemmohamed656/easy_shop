import 'package:flutter/material.dart';
import 'package:app_store/core/extensions/context_extension.dart';

class TestOne extends StatelessWidget {
  const TestOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        title: Text("test one"),
      ),
      body: Column(
        
        children: [
          Text("Hiiiiiiiiiiiiiiii")
        ],
      ),
    );
  }
}
