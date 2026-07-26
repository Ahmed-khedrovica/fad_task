import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:fad_task/core/networking/api_service.dart';
import 'package:fad_task/core/networking/dio_factory.dart';

import 'package:fad_task/features/login/data/repo/login_repository_impl.dart';
import 'package:fad_task/features/login/domain/repo/login_repository.dart';
import 'package:fad_task/features/login/domain/usecase/login_usecase.dart';
import 'package:fad_task/features/login/ui/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio());

  // Retrofit
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<ApiService>()),
  );

  // UseCase
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<LoginRepository>()),
  );

  // Cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));
}
