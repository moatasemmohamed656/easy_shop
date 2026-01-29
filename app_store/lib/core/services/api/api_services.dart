import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:app_store/core/services/api/api_constants.dart';
import 'package:app_store/features/auth/data/models/login_response.dart';
import 'package:app_store/features/auth/data/models/login_request_body.dart';
import 'package:app_store/features/auth/data/models/user_profile_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @GET(ApiConstants.profile)
  Future<UserProfileResponse> userProfile(
    
  );
}
