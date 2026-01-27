import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:app_store/core/services/api/api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
  

  // @GET('/tasks')
  // Future<List<Task>> getTasks();
}
