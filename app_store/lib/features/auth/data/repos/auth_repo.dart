import 'package:flutter/foundation.dart';
import 'package:app_store/core/services/api/api_result.dart';
import 'package:app_store/core/services/shared_pref/pref_keys.dart';
import 'package:app_store/core/services/shared_pref/shared_pref.dart';
import 'package:app_store/features/auth/data/models/sign_up_response.dart';
import 'package:app_store/features/auth/data/models/login_request_body.dart';
import 'package:app_store/features/auth/data/models/sign_up_reguest_body.dart';
import 'package:app_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:app_store/features/auth/data/models/user_profile_response.dart';

class AuthRepo {
  final AuthDataSource _dataSource;

  AuthRepo(this._dataSource);

  Future<ApiResult<UserProfileResponse>> loginAndFetchProfile(
    LoginRequestBody body,
  ) async {
    try {
      debugPrint('🔐 AuthRepo: start login');

      // LOGIN
      final loginResponse = await _dataSource.login(body);
      final token = loginResponse.accessToken;

      if (token == null || token.isEmpty) {
        debugPrint('❌ AuthRepo: token is null or empty');
        return ApiResult.error('Token is null');
      }

      debugPrint('✅ AuthRepo: token received');
      debugPrint('TOKEN ➜ $token');

      // SAVE TOKEN
      await SharedPref().setString(PrefKeys.accessToken, token);
      debugPrint(
        '💾 Saved Token ➜ ${SharedPref().getString(PrefKeys.accessToken)}',
      );

      //  FETCH PROFILE
      debugPrint('📡 AuthRepo: fetching user profile');
      final profile = await _dataSource.userProfile();

      debugPrint('👤 Profile Loaded');
      debugPrint('ID ➜ ${profile.id}');
      debugPrint('EMAIL ➜ ${profile.email}');
      debugPrint('ROLE ➜ ${profile.role}');

      //  SAVE ROLE (overwrite any old role)
      if (profile.role != null && profile.role!.isNotEmpty) {
        await SharedPref().setString(PrefKeys.role, profile.role!);

        debugPrint(
          '💾 Saved Role ➜ ${SharedPref().getString(PrefKeys.role)}',
        );
      } else {
        debugPrint('⚠️ AuthRepo: role is null or empty');
      }

      //  SUCCESS
      debugPrint('🎉 AuthRepo: login flow completed successfully');
      return ApiResult.success(profile);
    } catch (e, stack) {
      debugPrint('🔥 AuthRepo ERROR: $e');
      debugPrint('STACK TRACE:\n$stack');
      return ApiResult.error(e.toString());
    }
  }

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      debugPrint('🔐 AuthRepo: start sign up');
      final response = await _dataSource.signUp(body);
      return ApiResult.success(response);
    } catch (e) {
      debugPrint('🔥 AuthRepo ERROR: $e');
      debugPrint('STACK TRACE:\n$e');
      return ApiResult.error(e.toString());
    }
  }
}
