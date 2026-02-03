import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/core/style/font/font_family_helper.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar({
    super.key,
    this.isMain,
    required this.backgroundColor,
    required this.title,
  });

  final isMain;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: AppText(
        text: title,
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
          color: Colors.white,
        ),
      ),

      leading: IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
