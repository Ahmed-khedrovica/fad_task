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
      emit(LoginFailure(e.toString()));
    }
  }
}