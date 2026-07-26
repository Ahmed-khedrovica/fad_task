import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../repo/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<LoginResponse> call(LoginRequest request) {
    return _repository.login(request);
  }
}