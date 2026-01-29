import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/utils/app_regex.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/widgets/custom_text_field.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_bloc.dart';

class LoginTextForm extends StatefulWidget {
  LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = true;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authBloc.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller: _authBloc.emailController,
              validator: (value) {
                if (!AppRegex.isEmailValid(_authBloc.emailController.text)) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;
              },
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomFadeInLeft(
            duration: 400,
            child: CustomTextField(
              controller: _authBloc.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },

              hintText: context.translate(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,

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
