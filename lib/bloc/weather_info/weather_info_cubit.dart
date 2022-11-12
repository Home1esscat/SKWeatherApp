import 'package:bloc/bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/weather_info/weather_info_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApi weatherApi = WeatherApi();

  WeatherCubit() : super(WeatherLoadingState());

  Future<void> getWeatherByName(String city) async {
    try {
      emit(WeatherLoadingState());
      final weather = await weatherApi.getWeatherInCity(city);
      emit(WeatherLoadedState(cityWeatherModel: weather));
    } catch (e) {
      emit(
        WeatherErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> getWeatherById(String id) async {
    try {
      emit(WeatherLoadingState());
      final weather = await weatherApi.getWeatherInCityByID(id);
      emit(WeatherLoadedState(cityWeatherModel: weather));
    } catch (e) {
      emit(
        WeatherErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
