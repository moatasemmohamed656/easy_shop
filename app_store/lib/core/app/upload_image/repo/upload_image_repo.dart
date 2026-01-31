import 'package:image_picker/image_picker.dart';
import 'package:app_store/core/services/api/api_result.dart';
import 'package:app_store/core/app/connectivity_controller.dart';
import 'package:app_store/core/app/upload_image/data_source/upload_image_data_source.dart';

class UploadImageRepository {
  final UploadImageDataSource _dataSource;

  UploadImageRepository(this._dataSource);

  Future<ApiResult<String>> uploadImage({
    required XFile imageFile,
  }) async {
    if (!ConnectivityController.instance.isConnected.value) {
      return const ApiResult.error('لا يوجد اتصال بالإنترنت');
    }

    try {
      final response = await _dataSource.uploadImage(imageFile: imageFile);

      if (response.location != null && response.location!.isNotEmpty) {
        return ApiResult.success(response.location!);
      } else {
        return const ApiResult.error('فشل رفع الصورة');
      }
    } catch (e) {
      return ApiResult.error('problem uploading image $e');
    }
  }
}
