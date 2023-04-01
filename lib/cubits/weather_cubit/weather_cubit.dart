import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/service/service_weather.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.serviceWeather) : super(WeatherInitialState());
  ServiceWeather serviceWeather;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await serviceWeather.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (error) {
      emit(WeatherFailuarState());
    }
  }
}
