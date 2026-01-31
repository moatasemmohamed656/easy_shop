import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.login() = LoginEvent;
  const factory AuthEvent.signUp({required String imgUrl}) = SignUpEvent;
  
}