import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/model_weather.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${weatherData!.date}',
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          const Spacer(),
          Container(
            child: Row(
              /*MainAxisAlignment.spaceEvenly
            بنستخدمه ا علشان نعمل مسافات متساويه بين العناصر */
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset('assets/images/cloudy.png'),
                Expanded(
                  child: Image.network(
                    'https://cdn.weatherapi.com/weather/64x64/day/308.png',
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '${weatherData!.temp.toInt()}',
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'maxTemp: ${weatherData!.maxTemp.toInt()}',
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'minTemp: ${weatherData!.minTemp.toInt()}',
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(
            weatherData!.weatherStateName,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
