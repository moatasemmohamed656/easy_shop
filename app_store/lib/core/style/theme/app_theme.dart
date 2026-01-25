import 'package:flutter/material.dart';
import 'package:app_store/core/style/color/colors_dark.dart';
import 'package:app_store/core/style/color/colors_light.dart';
import 'package:app_store/core/style/theme/color_extensions.dart';
import 'package:app_store/core/style/font/font_family_helper.dart';
import 'package:app_store/core/style/theme/assets_extensions.dart';

ThemeData themeDark() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    scaffoldBackgroundColor: ColorsDark.mainColor,
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        // change
        fontFamily: FontFamilyHelper.cairoArabic
      )
    )
  );
}

ThemeData themeLight() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[MyColors.light ,MyAssets.light],
    scaffoldBackgroundColor: ColorsLight.mainColor,
    useMaterial3: true,
     textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsLight.black,
        // change
        fontFamily: FontFamilyHelper.cairoArabic
      )
    )
  );
}
