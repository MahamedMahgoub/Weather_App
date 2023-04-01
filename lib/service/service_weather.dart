import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/model_weather.dart';

class ServiceWeather {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    //WeatherModel? weather;

    String apiKey = 'eed10248cbec4d519a7125810232801';
    String BaseUrl = 'http://api.weatherapi.com/v1';
    /*Uri
     هنا هو هيحول الكول اللى ف الجيت من استرنج ل لينك يقدر يقراه */
    Uri url =
        Uri.parse('$BaseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }

/*jsonDecode
هنا هو بيحول النص اللى جاى على هيئه استراكتشر ب جوسن ل كود يعرف يتقرى عادى */
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel? weather = WeatherModel.fromjson(data);

    return weather;
  }
}
