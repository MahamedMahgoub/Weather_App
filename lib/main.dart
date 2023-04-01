import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/service/service_weather.dart';

import 'models/model_weather.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(ServiceWeather());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
