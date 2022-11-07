import 'package:weather_app/api/models/city_suggestiond_model.dart';

class CitySuggestionState {}

class WeatherLoadedState extends CitySuggestionState {
  List<CityList> cityListModel;
  WeatherLoadedState({required this.cityListModel});
}

class WeatherErrorState extends CitySuggestionState {
  String errorMessage;
  WeatherErrorState({required this.errorMessage});
}

class WeatherEmptyState extends CitySuggestionState {}
