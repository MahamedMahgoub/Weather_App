import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/screens/initial_page.dart';
import 'package:weather_app/screens/result_page.dart';
import 'package:weather_app/screens/search_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (State is WeatherSuccessState) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return ResultPage(weatherData: weatherData);
          } else if (state is WeatherFailuarState) {
            return Center(
              child: Container(
                width: 300,
                child: Center(
                  child: Text(
                    'Something Went Wrong!!\nPlease Try Again😓',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return InitialPage();
          }
        },
      ),
    );
  }
}
