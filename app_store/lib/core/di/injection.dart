import 'package:get_it/get_it.dart';
import 'package:app_store/core/app/app_cubit/app_cubit.dart';
import 'package:app_store/core/services/api/dio_factory.dart';
import 'package:app_store/core/services/api/api_services.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
}

final dio = DioFactory.getDio();

Future<void> _initCore() async {
  sl.registerFactory(AppCubit.new);
  sl.registerLazySingleton(() => ApiServices(dio));
}
