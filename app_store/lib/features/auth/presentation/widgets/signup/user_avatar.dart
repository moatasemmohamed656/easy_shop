import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/extensions/context_extension.dart';
import 'package:app_store/core/common/animations/animate_do.dart';
import 'package:app_store/core/app/upload_image/cubit/upload_image_cubit.dart';
// ignore_for_file: inference_failure_on_function_invocation


class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildInitialAvatar(context),
          loading: () => _buildLoadingAvatar(context),
          success: (imageUrl) => _buildSuccessAvatar(context, imageUrl),
          error: (message) => _buildErrorAvatar(context, message),
        );
      },
    );
  }

  Widget _buildInitialAvatar(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () => context.read<UploadImageCubit>().pickAndUploadImage(),
      child: CustomFadeInDown(
        duration: 500,
        child: CircleAvatar(
          backgroundColor: context.color.bluePinkLight,
          radius: 38,
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingAvatar(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: CircleAvatar(
        backgroundColor: context.color.bluePinkLight,
        radius: 38,
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3,
        ),
      ),
    );
  }

  Widget _buildSuccessAvatar(BuildContext context, String imageUrl) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () => _showImageOptions(context),
      child: CustomFadeInDown(
        duration: 500,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: context.color.bluePinkLight,
              radius: 38,
              backgroundImage: NetworkImage(imageUrl),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 12,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorAvatar(BuildContext context, String message) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
        context.read<UploadImageCubit>().pickAndUploadImage();
      },
      child: CustomFadeInDown(
        duration: 500,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: context.color.bluePinkLight,
              radius: 38,
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 12,
                child: const Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text('تغيير الصورة'),
                onTap: () {
                  Navigator.pop(bottomSheetContext);
                  context.read<UploadImageCubit>().pickAndUploadImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('حذف الصورة'),
                onTap: () {
                  Navigator.pop(bottomSheetContext);
                  context.read<UploadImageCubit>().removeImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('إلغاء'),
                onTap: () => Navigator.pop(bottomSheetContext),
              ),
            ],
          ),
        );
      },
    );
  }
}
