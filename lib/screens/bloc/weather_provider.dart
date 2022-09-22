import 'package:dio/dio.dart';
import 'package:weather/helpers/api_requester.dart';
import 'package:weather/helpers/catch_exception.dart';
import 'package:weather/models/weather_model.dart';

class Provider {
  Future<WeatherModel> GetWeather(String city) async {
    ApiRequster apiRequster = ApiRequster();
    try {
      Response response = await apiRequster.toGet(
          '/weather', {'q': city, 'appid': 'd0617a5c2dca461ecff826af2453a679'});
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }
      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}


