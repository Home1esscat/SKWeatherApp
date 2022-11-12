import 'package:weather_app/api/models/city_suggestiond_model.dart';

class CitySuggestionState {}

class CitySuggestionLoadedState extends CitySuggestionState {
  List<CityList> cityListModel;
  CitySuggestionLoadedState({required this.cityListModel});
}

class CitySuggestionErrorState extends CitySuggestionState {
  String errorMessage;
  CitySuggestionErrorState({required this.errorMessage});
}

class CitySuggestionEmptyState extends CitySuggestionState {}
