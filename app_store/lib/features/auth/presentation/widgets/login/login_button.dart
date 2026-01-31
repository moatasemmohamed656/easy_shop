import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/toast/show_toast.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/core/services/shared_pref/pref_keys.dart';
import 'package:app_store/core/services/shared_pref/shared_pref.dart';
import 'package:app_store/core/common/widgets/custom_linear_button.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_event.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_state.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loginSuccess: (user) async {
            final token = await SharedPref().getString(PrefKeys.accessToken);
            debugPrint('Token after login: $token');
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.loggedSuccessfully),
            );

            if (user.role == "admin") {
              context.pushName(Routes.homeAdmin);
            } else {
              context.pushName(Routes.homeCustomer);
            }
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message: context.translate(LangKeys.loggedError),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => CustomFadeInRight(
            duration: 600,
            child: CustomLinearButton(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          ),
          orElse: () => CustomFadeInRight(
            duration: 600,
            child: CustomLinearButton(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                if (!context.read<AuthBloc>().formKey.currentState!.validate())
                  return;
                context.read<AuthBloc>().add(const AuthEvent.login());
              },
              child: AppText(
                text: context.translate(LangKeys.login),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
