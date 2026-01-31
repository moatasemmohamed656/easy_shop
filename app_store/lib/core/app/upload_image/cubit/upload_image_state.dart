part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = Loading;
  const factory UploadImageState.success(String imageUrl) = Success;
  
  const factory UploadImageState.error(String message) = Error;
}
