import 'package:flutter/material.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/widgets/custom_text_field.dart';

class SignUpTextForm extends StatefulWidget {
  SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<SignUpTextForm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // name 
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: name,
            hintText: context.translate(LangKeys.fullName),
            keyboardType: TextInputType.name,
            validator: (value) {
              return null;
            },
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        // Email
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
