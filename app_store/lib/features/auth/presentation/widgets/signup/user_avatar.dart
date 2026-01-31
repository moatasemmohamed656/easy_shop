import 'package:flutter/material.dart';
import 'package:app_store/core/utils/image_pick.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/animations/animate_do.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () => PickImageUtils().pickImage(),
      child: CustomFadeInDown(
        duration: 500,
        child: CircleAvatar(
          backgroundColor: context.color.bluePinkLight,
          radius: 38,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
