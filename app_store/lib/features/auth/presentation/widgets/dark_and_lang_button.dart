import 'package:flutter/material.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/core/common/widgets/custom_linear_button.dart';

class DarkAndLangButton extends StatelessWidget {
  const DarkAndLangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark mode button
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            child: Icon(
              Icons.light_mode_rounded,
              color: Colors.white,
            ),
          ),
        ),
        // lang Button
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            height: 44.h,
            width: 100.w,
            child: AppText(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
