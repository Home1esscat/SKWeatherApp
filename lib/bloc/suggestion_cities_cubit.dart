import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/suggestion_cities_state.dart';

import '../api/models/city_suggestiond_model.dart';
import '../api/weather_api.dart';

class CitySuggestionCubit extends Cubit<CitySuggestionState> {
  final WeatherApi weatherApi = WeatherApi();

  CitySuggestionCubit() : super(WeatherEmptyState());

  List<CityList> internalList = [];

  Future<void> setWeather(List<CityList> list) async {
    try {
      emit(WeatherEmptyState());
      final listCities = list;
      emit(WeatherLoadedState(cityListModel: listCities));
      internalList = list;
    } catch (e) {
      emit(
        WeatherErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<List<CityList>> getSuggestionsCityList(List<CityList> list) async {
    return internalList;
  }
}
