import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await _loginUseCase(
        LoginRequest(
          username: username,
          password: password,
        ),
      );

      emit(LoginSuccess(response: response));
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        String errorMessage = 'Login failed. Please try again.';
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message'].toString();
        } else if (e.message != null && e.message!.isNotEmpty) {
          errorMessage = e.message!;
        }
        emit(LoginFailure(errorMessage));
      } else {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}