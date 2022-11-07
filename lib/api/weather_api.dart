import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/models/city_suggestiond_model.dart';
import 'package:weather_app/api/models/city_weather_model.dart';

import 'api_key.dart';

class WeatherApi {
  String baseURL = 'api.openweathermap.org';
  String getWeatherByCityName = 'data/2.5/weather';
  String getCitiesSuggestion = '/data/2.5/find';

  Future<CityWeatherModel> getWeatherInCity(String city) async {
    var params = {'q': city, 'appid': openWeatherApiKey, 'units': 'metric'};

    var uri = Uri.https(baseURL, getWeatherByCityName, params);

    var request = await http.get(uri);

    CityWeatherModel cityWeatherModel =
        CityWeatherModel.fromJson(json.decode(request.body));

    print(cityWeatherModel.name);

    return cityWeatherModel;
  }

  Future<CityWeatherModel> getWeatherInCityByID(String cityID) async {
    var params = {'id': cityID, 'appid': openWeatherApiKey, 'units': 'metric'};

    var uri = Uri.https(baseURL, getWeatherByCityName, params);

    var request = await http.get(uri);

    CityWeatherModel cityWeatherModel =
        CityWeatherModel.fromJson(json.decode(request.body));

    print(cityWeatherModel.name);

    return cityWeatherModel;
  }

  Future<List<CityList>> getCitySuggestion(String city) async {
    var params = {'q': city, 'appid': openWeatherApiKey, 'units': 'metric'};

    var uri = Uri.https(baseURL, getCitiesSuggestion, params);

    var request = await http.get(uri);

    CitiesSuggestionsModel citiesSuggestionsModel =
        CitiesSuggestionsModel.fromJson(json.decode(request.body));

    List<CityList> suggestions = citiesSuggestionsModel.list!.toList();

    return suggestions;
  }
}
