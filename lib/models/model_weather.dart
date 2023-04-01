import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String weatherStateIcon;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.weatherStateIcon,
  });

/*Named Constracutor
هو اللى هيبنى الكونستراكتور على حسب الداتا اللى جايه له 

  WeatherModel.fromjson(dynamic data) {
    var josnData = data['forecast']['forecastday']['0'];
    date = data['location']['localtime'];
    temp = josnData['avgtemp_c'];
    maxTemp = josnData['maxtemp_c'];
    minTemp = josnData['mintemp_c'];
    weatherStateName = josnData['condition']['text'];
    weatherStateIcon = josnData['condition']['icon'];
  }
   */

/*factory 
هو دا عباره عن كونستراكتور عادى جدا بس فكرته انه بيرجع اوبجيكت والاوبوجيت دا هو اللى بيبنى الكونستراكتور */
  factory WeatherModel.fromjson(dynamic data) {
    var josnData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: josnData['avgtemp_c'],
        maxTemp: josnData['maxtemp_c'],
        minTemp: josnData['mintemp_c'],
        weatherStateName: josnData['condition']['text'],
        weatherStateIcon: josnData['condition']['icon']);
  }

  @override
  String toString() {
    return 'temp = $temp minTemp = $minTemp date = $date';
  }

  String getImages() {
    if (weatherStateName == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear') {
      return Colors.yellow;
    } else if (weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return Colors.blueGrey;
    } else {
      return Colors.green;
    }
  }
}
