import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/bloc/weather_bloc.dart';
import 'package:weather/screens/home_screen/home_screen.dart';
import 'package:weather/screens/select_city_screen/select_city_form.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({Key? key}) : super(key: key);

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  TextStyle stil = const TextStyle(color: Colors.white);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => WeatherBloc(), child: SelectCityForm()),
    );
  }
}
