import 'package:get_it/get_it.dart';
import 'package:app_store/core/app/app_cubit/app_cubit.dart';

final sl = GetIt.instance;

Future<void> setUpInjector() async {
  sl.registerFactory(AppCubit.new);
  
}
