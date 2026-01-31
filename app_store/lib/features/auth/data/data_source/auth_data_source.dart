import 'package:app_store/core/services/api/api_services.dart';
import 'package:app_store/features/auth/data/models/login_response.dart';
import 'package:app_store/features/auth/data/models/sign_up_response.dart';
import 'package:app_store/features/auth/data/models/login_request_body.dart';
import 'package:app_store/features/auth/data/models/sign_up_reguest_body.dart';
import 'package:app_store/features/auth/data/models/user_profile_response.dart';

class AuthDataSource {
  final ApiServices _apiServices;

  AuthDataSource(this._apiServices);


 // Login
  Future<LoginResponse> login(LoginRequestBody body) async =>
      await _apiServices.login(body);

  // profile
  Future<UserProfileResponse> userProfile() async =>
      await _apiServices.userProfile();

  // Sign Up

  Future<SignUpResponse> signUp(SignUpRequestBody body) async =>
      await _apiServices.signUp(body);
}
