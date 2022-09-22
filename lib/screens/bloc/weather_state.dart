part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherFetchedState extends WeatherState {
  WeatherModel weatherModel;
  final String background;
  final Color colortxt;

  WeatherFetchedState(
      {required this.colortxt,
      required this.background,
      required this.weatherModel});
}

class WeatherErrorState extends WeatherState {
  CatchException error;

  WeatherErrorState(this.error);
}
