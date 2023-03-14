import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:theweather/models/model_weather.dart';

class ServiceWeather {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      String apiKey = 'eed10248cbec4d519a7125810232801';
      String BaseUrl = 'http://api.weatherapi.com/v1';
      /*Uri
     هنا هو هيحول الكول اللى ف الجيت من استرنج ل لينك يقدر يقراه */
      Uri url =
          Uri.parse('$BaseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      http.Response response = await http.get(url);
/*jsonDecode
هنا هو بيحول النص اللى جاى على هيئه استراكتشر ب جوسن ل كود يعرف يتقرى عادى */
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
