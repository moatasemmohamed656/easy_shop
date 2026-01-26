import 'package:flutter/material.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Title
        AppText(
          text: context.translate(LangKeys.login),
          theme: context.textStyle.copyWith(
            fontSize: 24.sp,
            color: context.color.textColor,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        // Description
        AppText(
          text: context.translate(LangKeys.welcome),
          theme: context.textStyle.copyWith(
            fontSize: 16.sp,
            color: context.color.textColor,
            fontWeight: FontWeightHelper.medium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
