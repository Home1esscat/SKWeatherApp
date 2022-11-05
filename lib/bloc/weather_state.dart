import 'package:weather_app/api/models/city_weather_model.dart';

abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  CityWeatherModel cityWeatherModel;
  WeatherLoadedState({required this.cityWeatherModel});
}

class WeatherErrorState extends WeatherState {
  String errorMessage;
  WeatherErrorState({required this.errorMessage});
}
