import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:app_store/core/app/app_cubit/app_cubit.dart';
import 'package:app_store/core/services/api/dio_factory.dart';
import 'package:app_store/core/services/api/api_services.dart';
import 'package:app_store/features/auth/data/repos/auth_repo.dart';
import 'package:app_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_store/features/auth/data/data_source/auth_data_source.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

final dio = DioFactory.getDio();
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> _initCore() async {
  sl.registerFactory(AppCubit.new);
  sl.registerLazySingleton(() => ApiServices(dio));
  sl.registerLazySingleton(() => navigatorKey);
}

Future<void> _initAuth() async {
  sl..registerFactory(() => AuthBloc(sl()));
  sl..registerFactory(() => AuthRepo(sl()));
  sl..registerFactory(() => AuthDataSource(sl()));
}
