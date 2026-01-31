import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/core/utils/image_pick.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_store/core/services/api/api_result.dart';
import 'package:app_store/core/app/upload_image/repo/upload_image_repo.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepository _repository;

  UploadImageCubit(this._repository) : super(const UploadImageState.initial());

  String? uploadedImageUrl;

  Future<void> pickAndUploadImage() async {
    // اختيار الصورة
    final imageFile = await PickImageUtils().pickImage();

    if (imageFile == null) {
      emit(const UploadImageState.error('لم يتم اختيار صورة'));
      return;
    }

    // بدء الرفع
    emit(const UploadImageState.loading());

    // رفع الصورة
    final result = await _repository.uploadImage(imageFile: imageFile);

    result.when(
      success: (imageUrl) {
        uploadedImageUrl = imageUrl;
        emit(UploadImageState.success(imageUrl));
      },
      error: (message) {
        emit(UploadImageState.error(message));
      },
    );
  }

  // دالة حذف الصورة محلياً (بما أن الـ API غير موجود)
  void removeImage() {
    uploadedImageUrl = null;
    emit(const UploadImageState.initial());
  }

  void resetState() {
    uploadedImageUrl = null;
    emit(const UploadImageState.initial());
  }
}
