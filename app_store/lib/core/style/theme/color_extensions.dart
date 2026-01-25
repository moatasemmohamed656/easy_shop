import 'package:flutter/material.dart';
import 'package:app_store/core/style/color/colors_dark.dart';
import 'package:app_store/core/style/color/colors_light.dart';

class MyColor extends ThemeExtension<MyColor> {
  const MyColor({required this.mainColor});

  final Color? mainColor;

  @override
  MyColor copyWith({Color? mainColor}) {
    return MyColor(
      mainColor: mainColor ?? this.mainColor,
    );
  }

  @override
  MyColor lerp(
    covariant ThemeExtension<MyColor>? other,
    double t,
  ) {
    if (other is! MyColor) {
      return this;
    }

    return MyColor(
      mainColor: Color.lerp(mainColor, other.mainColor, t),
    );
  }

  static const MyColor dark = MyColor(mainColor: ColorsDark.mainColor);
   static const MyColor light = MyColor(mainColor: ColorsLight.mainColor);
}
