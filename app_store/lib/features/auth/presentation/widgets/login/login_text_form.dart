import 'package:flutter/material.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/widgets/custom_text_field.dart';

class LoginTextForm extends StatefulWidget {
  LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInRight(
          duration: 400,
          child: CustomTextField(
            controller: email,
            hintText: context.translate(LangKeys.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return null;
            },
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomTextField(
            controller: password,
            hintText: context.translate(LangKeys.password),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              return null;
            },
            obscureText: isShowPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isShowPassword = !isShowPassword;
                });
              },
              icon: Icon(
                isShowPassword ? Icons.visibility_off : (Icons.visibility),
                color: context.color.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
