class CityWeatherModel {
  List<Weather> weather;
  String base;
  Main main;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;

  CityWeatherModel({
    required this.weather,
    required this.base,
    required this.main,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
  });

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) {
    var weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();

    var main = Main.fromJson(json['main']);

    var sys = Sys.fromJson(json['sys']);

    return CityWeatherModel(
        weather: weather,
        base: json['base'],
        main: main,
        dt: json['dt'],
        sys: sys,
        timezone: json['timezone'],
        id: json['id'],
        name: json['name']);
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}

class Main {
  num temp;
  double tempMin;
  double tempMax;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max']);
  }
}

class Sys {
  String country;

  Sys({
    required this.country,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(country: json['country']);
  }
}
