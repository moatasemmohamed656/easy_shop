import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/routing/routes.dart';
import 'package:app_store/core/language/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_store/core/common/toast/show_toast.dart';
import 'package:app_store/core/common/widgets/app_text.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/style/font/font_weight_helper.dart';
import 'package:app_store/core/common/widgets/custom_linear_button.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_event.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_state.dart';
import 'package:app_store/core/app/upload_image/cubit/upload_image_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          signUpSuccess: () {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.loggedSuccessfully),
            );
            context.pushNamedAndRemoveUntil(Routes.loginScreen);
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
              child: Center(
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          orElse: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  _handleSignUp(context);
                },
                child: AppText(
                  text: context.translate(LangKeys.signUp),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

void _handleSignUp(BuildContext context) {
  final uploadCubit = context.read<UploadImageCubit>();

  // تحقق من وجود رابط الصورة
  if (uploadCubit.uploadedImageUrl == null ||
      uploadCubit.uploadedImageUrl!.isEmpty) {
    ShowToast.showToastErrorTop(
      message: context.translate(LangKeys.imageUploaded),
    );
    return;
  }

  // أرسل طلب التسجيل مع رابط الصورة
  context.read<AuthBloc>().add(
    SignUpEvent(imgUrl: uploadCubit.uploadedImageUrl!), // ✅ رابط الصورة
  );
}
