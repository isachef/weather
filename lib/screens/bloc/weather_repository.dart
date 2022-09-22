import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/bloc/weather_provider.dart';

class Repository {
  Provider provider = Provider();

  Future<WeatherModel> getWeather(String city) {
    return provider.GetWeather(city);
  }
}
