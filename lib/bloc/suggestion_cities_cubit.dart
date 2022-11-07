import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/suggestion_cities_state.dart';

import '../api/models/city_suggestiond_model.dart';
import '../api/weather_api.dart';

class CitySuggestionCubit extends Cubit<CitySuggestionState> {
  final WeatherApi weatherApi = WeatherApi();

  CitySuggestionCubit() : super(CitySuggestionEmpty());

  List<CityList> internalList = [];

  Future<void> setWeather(List<CityList> list) async {
    if (list.isEmpty) {
      emit(
        CitySuggestionError(
          errorMessage: 'ERROR',
        ),
      );
    } else {
      emit(CitySuggestionEmpty());
      final listCities = list;
      emit(CitySuggestionLoaded(cityListModel: listCities));
      internalList = list;
    }
  }

  Future<List<CityList>> getSuggestionsCityList() async {
    return internalList;
  }
}