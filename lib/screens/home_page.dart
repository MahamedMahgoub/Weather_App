import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_cubit.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_state.dart';
import 'package:weather_app/screens/failuar_page.dart';
import 'package:weather_app/screens/initial_page.dart';
import 'package:weather_app/screens/loading_data.dart';
import 'package:weather_app/screens/success_page.dart';

import '../Models/weather_model.dart';

class HomePage extends StatelessWidget {
  static const String id = 'Home Page';
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return LoadingData();
        } else if (state is WeatherSuccessState) {
          return SuccessBody(weatherData: state.weatherModel);
        } else if (state is WeatherFailureState) {
          return const FailureBody();
        } else {
          return const InitialBody();
        }
      },
    );
  }
}
