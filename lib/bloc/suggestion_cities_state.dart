import 'package:weather_app/api/models/city_suggestiond_model.dart';

class CitySuggestionState {}

class CitySuggestionLoaded extends CitySuggestionState {
  List<CityList> cityListModel;
  CitySuggestionLoaded({required this.cityListModel});
}

class CitySuggestionError extends CitySuggestionState {
  String errorMessage;
  CitySuggestionError({required this.errorMessage});
}

class CitySuggestionEmpty extends CitySuggestionState {}
