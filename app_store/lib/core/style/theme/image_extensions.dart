import 'package:flutter/material.dart';
import 'package:app_store/core/style/images/app_images.dart';

class MyImages extends ThemeExtension<MyImages> {
  const MyImages({required this.image});

  final String? image;

  @override
  MyImages copyWith({Color? mainColor}) {
    return MyImages(
      image: image ?? this.image,
    );
  }

  @override
  MyImages lerp(
    covariant ThemeExtension<MyImages>? other,
    double t,
  ) {
    if (other is! MyImages) {
      return this;
    }

    return MyImages(
      image: image,
    );
  }

  static const MyImages dark = MyImages(
    image: AppImages.noNetwork,
  );
  static const MyImages light = MyImages(image: AppImages.noNetwork);
}
