import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_store/core/services/api/api_services.dart';
import 'package:app_store/core/app/upload_image/models/upload_image_response.dart';

class UploadImageDataSource {
  final ApiServices _apiServices;

  UploadImageDataSource(this._apiServices);

  Future<UploadImageResponse> uploadImage({
    required XFile imageFile,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.name,
      ),
    });

    return await _apiServices.uploadImage(formData);
  }
}
