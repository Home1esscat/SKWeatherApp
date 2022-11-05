import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApi weatherApi = WeatherApi();

  WeatherCubit() : super(WeatherLoadingState());

  Future<void> getWeather(String city) async {
    emit(WeatherLoadingState());
    final weather = await weatherApi.getWeatherInCity(city);
    emit(WeatherLoadedState(cityWeatherModel: weather));
  }
}
