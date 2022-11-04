import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/models/city_weather_model.dart';

import 'api_key.dart';

class WeatherApi {
  String baseURL = 'api.openweathermap.org';
  String getWeatherByCityName = 'data/2.5/weather';
  String getCitiesListByName = '/data/2.5/find';

  Future<CityWeatherModel> getWeatherInCity(String city) async {
    var params = {'q': city, 'appid': openWeatherApiKey, 'units': 'metric'};

    var uri = Uri.https(baseURL, getWeatherByCityName, params);

    var request = await http.get(uri);

    CityWeatherModel cityWeatherModel =
        CityWeatherModel.fromJson(json.decode(request.body));

    print(cityWeatherModel.name);

    return cityWeatherModel;
  }

  Future<void> getCitiesListByKeyword(String city) async {
    var params = {'q': city, 'appid': openWeatherApiKey, 'units': 'metric'};

    var uri = Uri.https(baseURL, getCitiesListByName, params);

    var request = await http.get(uri);
  }
}
