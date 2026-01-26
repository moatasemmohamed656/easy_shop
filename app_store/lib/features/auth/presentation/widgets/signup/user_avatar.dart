import 'package:flutter/material.dart';
import 'package:app_store/core/common/animations/animate_do.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: CircleAvatar(
        radius: 38,
        backgroundImage: NetworkImage(""),
      ),
    );
  }
}
