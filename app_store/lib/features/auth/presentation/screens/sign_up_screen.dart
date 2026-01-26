import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/features/auth/presentation/refactor/sign_up_body.dart';
import 'package:app_store/features/auth/presentation/refactor/auth_custom_printer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 100.h),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkDark!,
            ],
          ),
        ),
      ),
      body: const SafeArea(bottom: false, child: SignUpBody()),
    );
  }
}
