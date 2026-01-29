import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_store/core/services/api/api_result.dart';
import 'package:app_store/features/auth/data/repos/auth_repo.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_state.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_event.dart';
import 'package:app_store/features/auth/data/models/login_request_body.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepo) : super(const AuthState.initial()) {
    on<LoginEvent>(_login);
  }

  final AuthRepo _authRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Method to login
  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    // Validate form first
    if (!formKey.currentState!.validate()) return;

    emit(const AuthState.loading());

    try {
      final result = await _authRepo.loginAndFetchProfile(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );

      result.when(
        success: (userProfile) {
          // Emit success state with user data
          emit(AuthState.success(userRole: userProfile));
        },
        error: (errorMessage) {
          emit(AuthState.error(message: errorMessage));
        },
      );
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }
}
