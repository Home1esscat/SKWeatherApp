import 'package:bloc/bloc.dart';
import 'package:weather_app/api/models/city_weather_model.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApi weatherApi;

  WeatherCubit(this.weatherApi) : super(WeatherEmptyState());

  Future<void> fetchWeather() async {
    try {
      emit(WeatherLoadingState());
      CityWeatherModel loadedCity = await weatherApi.getWeatherInCity('Odessa');
      emit(WeatherLoadedState(loadedCity: loadedCity));
    } catch (_) {
      emit(WeatherErrorState());
    }
  }
}
