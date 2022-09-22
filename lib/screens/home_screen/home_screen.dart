import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String city;
  final WeatherModel weatherModel;
  final String imageUrl;
  final Color colortxt;

  const HomeScreen(
      {Key? key,
      required this.city,
      required this.weatherModel,
      required this.imageUrl,
      required this.colortxt})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late WeatherBloc bloc;
  @override
  void initState() {
    // bloc = BlocProvider.of<WeatherBloc>(context);
    // bloc.add(GetWeatherEvent(city: "Moscow"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              Image.network(
                "https://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon!}@2x.png",
              ),
              Text(
                widget.city.toUpperCase(),
                style: TextStyle(fontSize: 45, color: widget.colortxt),
              ),
              Text(
                '${(widget.weatherModel.main!.temp! - 273.5).round()}°С',
                style: TextStyle(color: widget.colortxt, fontSize: 40),
              ),
              Divider(),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: widget.colortxt),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      "https://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon!}@2x.png",
                    ),
                    Column(
                      children: [
                        Text(
                          widget.weatherModel.weather!.first.main.toString(),
                          style:
                              TextStyle(color: widget.colortxt, fontSize: 20),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${(widget.weatherModel.main!.tempMin! - 273.5).round()}/${(widget.weatherModel.main!.tempMax! - 273.5).round()}°С',
                          style:
                              TextStyle(color: widget.colortxt, fontSize: 18),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.weatherModel.weather!.first.description
                              .toString(),
                          style:
                              TextStyle(color: widget.colortxt, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
