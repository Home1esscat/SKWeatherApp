import 'package:flutter/material.dart';
import 'package:weather_app/api/models/city_weather_model.dart';

abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  CityWeatherModel loadedCity;
  WeatherLoadedState({required this.loadedCity}) : assert(loadedCity != null);
}

class WeatherErrorState extends WeatherState {}
