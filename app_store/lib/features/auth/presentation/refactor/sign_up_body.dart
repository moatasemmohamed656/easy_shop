import 'package:flutter/material.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:app_store/features/auth/presentation/widgets/signup/user_avatar.dart';
import 'package:app_store/features/auth/presentation/widgets/dark_and_lang_button.dart';
import 'package:app_store/features/auth/presentation/widgets/signup/sign_up_button.dart';
import 'package:app_store/features/auth/presentation/widgets/signup/sign_up_text_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w, vertical: 20.h),

      child: SingleChildScrollView(
        child: Column(
          children: [
            // Dark mode and lang
             DarkAndLangButton(),
            SizedBox(
              height: 50.h,
            ),
            // welcome info
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              dec: context.translate(LangKeys.welcome),
            ),
            SizedBox(
              height: 30.h,
            ),

            // User Avatar image
            UserAvatar(),

            SizedBox(
              height: 30,
            ),
            // Signup TextForm
            SignUpTextForm(),

            SizedBox(
              height: 30.h,
            ),

            // Signup Button
            SignUpButton(),

            SizedBox(
              height: 30.h,
            ),

            // Go to Login Screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
                child: AppText(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
