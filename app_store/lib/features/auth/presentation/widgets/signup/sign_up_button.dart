import 'package:flutter/material.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/core/common/widgets/custom_linear_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: AppText(
          text: context.translate(LangKeys.signUp),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),
    );
  }
}
