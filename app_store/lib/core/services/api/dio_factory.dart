import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:app_store/core/services/shared_pref/pref_keys.dart';
import 'package:app_store/core/services/shared_pref/shared_pref.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final token = SharedPref().getString(PrefKeys.accessToken);
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
        ),
      );

      addDioInterceptor();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        request: false,
        compact: false,
      ),
    );
  }
}
