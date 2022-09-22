import 'package:dio/dio.dart';
import 'package:weather/helpers/catch_exception.dart';

class ApiRequster {
  static String url = 'https://api.openweathermap.org/data/2.5';

  Dio initDio() {
    return Dio(BaseOptions(
      baseUrl: url,
      receiveTimeout: 10000,
      connectTimeout: 10000,
      responseType: ResponseType.json,
    ),);
  }

  Future<Response> toGet(
    String path,
    Map<String, dynamic>? queryParameters,
  ) async {
    Dio dio = initDio();
    try {
      return dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
