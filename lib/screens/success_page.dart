import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_cubit.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/screens/search_page.dart';

class SuccessBody extends StatelessWidget {
  WeatherModel? weatherData;

  SuccessBody({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BlocProvider.of<WeatherCubit>(context)
              .weatherModel!
              .getThemeColors(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SearchPage.id,
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ))
          ],
          centerTitle: true,
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          // color: weatherData!.getThemeColors(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColors(),
              weatherData!.getThemeColors()[300]!,
              weatherData!.getThemeColors()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                BlocProvider.of<WeatherCubit>(context).cityName!,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weatherData!.date.toString(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(weatherData!.getImage()),
                  Text('${weatherData!.temp.toInt()}',
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold)),
                  Column(
                    children: [
                      Text('max.temp: ${weatherData!.maxTemp.toInt()}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Text('min.temp: ${weatherData!.minTemp.toInt()}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(weatherData!.condition,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ));
  }
}
