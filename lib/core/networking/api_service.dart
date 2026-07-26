import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fad_task/features/login/data/models/login_request.dart';
import 'package:fad_task/features/login/data/models/login_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('auth/login')
  Future<LoginResponse> login(
      @Body() LoginRequest request,
      );
}