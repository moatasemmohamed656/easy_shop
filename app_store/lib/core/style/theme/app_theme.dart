import 'package:flutter/material.dart';
import 'package:app_store/core/style/color/colors_dark.dart';
import 'package:app_store/core/style/color/colors_light.dart';
import 'package:app_store/core/style/theme/image_extensions.dart';
import 'package:app_store/core/style/theme/color_extensions.dart';

ThemeData themeDark() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[MyColor.dark, MyImages.dark],
    scaffoldBackgroundColor: ColorsDark.mainColor,
    useMaterial3: true,
  );
}

ThemeData themeLight() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[MyColor.light ,MyImages.light],
    scaffoldBackgroundColor: ColorsLight.mainColor,
    useMaterial3: true,
  );
}
