import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_store/features/auth/data/models/user_profile_response.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success({
    required UserProfileResponse userRole,
  }) = Success;
  const factory AuthState.error({
    required String message,
  }) = Error;
}
