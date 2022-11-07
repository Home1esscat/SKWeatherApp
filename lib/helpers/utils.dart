import 'package:intl/intl.dart';
import 'package:weather_app/api/weather_api.dart';

import '../bloc/suggestion_cities_cubit.dart';
import '../bloc/suggestions_popup_cubit.dart';

class Utils {
  static String getCurrentYear() {
    return DateFormat('yyyy').format(
      DateTime.now(),
    );
  }

  static String unixToDate(int time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return (DateFormat('d MMM yyy').format(date));
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
