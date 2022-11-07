import 'package:intl/intl.dart';
import 'package:weather_app/api/weather_api.dart';

import '../bloc/cities_suggestion_cubit.dart';
import '../bloc/suggestions_cubit.dart';

class Utils {
  static String getCurrentYear() {
    return DateFormat('yyyy').format(
      DateTime.now(),
    );
  }

  static void searchData(
      SuggestionsCubit uiCubit,
      CitySuggestionCubit cubitSuggestion,
      WeatherApi weatherApi,
      String textFromController) {
    weatherApi.getCitySuggestion(textFromController).then((value) {
      uiCubit.changeSuggestionState(true /*!uiCubit.state.showSuggstion*/);
      cubitSuggestion.setWeather(value);
    });
  }
}
