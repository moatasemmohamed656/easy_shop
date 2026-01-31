import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/utils/app_regex.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/widgets/custom_text_field.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_bloc.dart';

class SignUpTextForm extends StatefulWidget {
  SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<SignUpTextForm> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _authBloc.emailController.dispose();
    _authBloc.passwordController.dispose();
    _authBloc.nameController.dispose();
    super.dispose();
  }

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authBloc.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // name
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _authBloc.nameController,
              hintText: context.translate(LangKeys.fullName),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (!AppRegex.isNameValid(_authBloc.nameController.text)) {
                  return context.translate(LangKeys.validName);
                }
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
              controller: _authBloc.emailController,
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!AppRegex.isEmailValid(_authBloc.emailController.text)) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          // Password
          CustomFadeInLeft(
            duration: 400,
            child: CustomTextField(
              controller: _authBloc.passwordController,
              hintText: context.translate(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
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
      ),
    );
  }
}
