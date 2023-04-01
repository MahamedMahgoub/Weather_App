import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WeatherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) {
              cityName = value;
              cubit.cityName = cityName;
              cubit.getWeather(cityName: cityName!);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search a City',
              label: Text(
                'Search',
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              suffixIcon: GestureDetector(
                  onTap: () {
                    cubit.cityName = cityName;
                    cubit.getWeather(cityName: cityName!);

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
