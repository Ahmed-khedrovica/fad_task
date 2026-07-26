import 'package:fad_task/core/networking/api_service.dart';

import 'package:fad_task/features/login/data/models/login_request.dart';
import 'package:fad_task/features/login/data/models/login_response.dart';
import 'package:fad_task/features/login/domain/repo/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiService _apiService;

  LoginRepositoryImpl(this._apiService);

  @override
  Future<LoginResponse> login(LoginRequest request) {
    return _apiService.login(request);
  }
}