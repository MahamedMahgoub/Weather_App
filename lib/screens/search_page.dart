import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theweather/models/model_weather.dart';
import 'package:theweather/providrs/weather_provider.dart';
import 'package:theweather/service/service_weather.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateui});
  VoidCallback? updateui;
  @override
  Widget build(BuildContext context) {
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
            onSubmitted: (value) async {
              cityName = value;

              ServiceWeather service = ServiceWeather();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).WeatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

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
                  onTap: () async {
                    ServiceWeather service = ServiceWeather();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .WeatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

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
