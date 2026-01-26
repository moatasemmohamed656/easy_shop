import 'package:flutter/material.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:app_store/features/auth/presentation/widgets/login/login_button.dart';
import 'package:app_store/features/auth/presentation/widgets/dark_and_lang_button.dart';
import 'package:app_store/features/auth/presentation/widgets/login/login_text_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w, vertical: 20.h),

      child: Column(
        children: [
          // Dark mode and lang
          const DarkAndLangButton(),
          SizedBox(
            height: 50.h,
          ),
          // welcome info
          AuthTitleInfo(),
          SizedBox(
            height: 30.h,
          ),

          // login TextForm
          LoginTextForm(),

          SizedBox(
            height: 30.h,
          ),

          // Login Button
          LoginButton(),

          SizedBox(
            height: 30.h,
          ),

          // Go to sign Up Screen
          CustomFadeInDown(
            duration: 400,
            child: AppText(
              text: context.translate(LangKeys.createAccount),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.bluePinkLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
