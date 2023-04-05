import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_state.dart';
import 'package:weather_app/Services/weather_service.dart';

import '../../Models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());

    try {
      weatherModel = await weatherService.getWeatherService(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
