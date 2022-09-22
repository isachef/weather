import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather/helpers/catch_exception.dart';
import 'package:weather/helpers/utils.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/bloc/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      Repository repository = Repository();
      WeatherModel weatherModel;
      String imgUrl;
      
      try {
        if (event.city.isNotEmpty) {
          emit(WeatherLoadingState());

          weatherModel = await repository.getWeather(event.city);
          imgUrl = getBackground(weatherModel.weather!.first.icon!).first;

          emit(WeatherFetchedState(
              weatherModel: weatherModel,
              background: imgUrl,
              colortxt: getBackground(weatherModel.weather!.first.icon!).last));
        } else {
          throw TextEditingEmptyException();
        }
      } catch (e) {
        log(e.runtimeType.toString());

        emit(WeatherErrorState(CatchException.convertException(e)));
      }
    });
  }
}

class TextEditingEmptyException {}
