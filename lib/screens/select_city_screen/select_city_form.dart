import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/bloc/weather_bloc.dart';
import 'package:weather/screens/home_screen/home_screen.dart';

class SelectCityForm extends StatefulWidget {
  const SelectCityForm({Key? key}) : super(key: key);

  @override
  State<SelectCityForm> createState() => _SelectCityFormState();
}

class _SelectCityFormState extends State<SelectCityForm> {
  late WeatherBloc _weatherBloc;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/start_img.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Spacer(
              flex: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(
                  255,
                  22,
                  140,
                  144,
                ),
              ),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {
                  _weatherBloc.add(GetWeatherEvent(city: value));
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            BlocConsumer<WeatherBloc, WeatherState>(
              bloc: _weatherBloc,
              listener: (context, state) {
                if (state is WeatherFetchedState) {
                  log(state.weatherModel.name!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: _weatherBloc,
                        child: HomeScreen(
                          city: controller.text,
                          weatherModel: state.weatherModel,
                          imageUrl: state.background,
                          colortxt: state.colortxt,
                        ),
                      ),
                    ),
                  );
                }
                if (state is WeatherErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error.message!),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is WeatherLoadingState) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      const CircularProgressIndicator(),
                    ],
                  );
                }

                return ElevatedButton(
                  onPressed: () {
                    _weatherBloc
                        .add(GetWeatherEvent(city: controller.text.toString()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(
                      255,
                      22,
                      140,
                      144,
                    ),
                  ),
                  child: const Text('find'),
                );
              },
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
