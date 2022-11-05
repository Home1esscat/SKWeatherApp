class CityWeatherModel {
  CityWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });
  late final Coord coord;
  late final List<Weather> weather;
  late final String base;
  late final Main main;
  late final int visibility;
  late final Wind wind;
  late final Clouds clouds;
  late final int dt;
  late final Sys sys;
  late final int timezone;
  late final int id;
  late final String name;
  late final int cod;

  CityWeatherModel.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']);
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    base = json['base'];
    main = Main.fromJson(json['main']);
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    dt = json['dt'];
    sys = Sys.fromJson(json['sys']);
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coord'] = coord.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['base'] = base;
    _data['main'] = main.toJson();
    _data['visibility'] = visibility;
    _data['wind'] = wind.toJson();
    _data['clouds'] = clouds.toJson();
    _data['dt'] = dt;
    _data['sys'] = sys.toJson();
    _data['timezone'] = timezone;
    _data['id'] = id;
    _data['name'] = name;
    _data['cod'] = cod;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });
  late final num lon;
  late final num lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lon'] = lon;
    _data['lat'] = lat;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
  late final num temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });
  late final num speed;
  late final num deg;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;

    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class Sys {
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
  late final String country;
  late final int sunrise;
  late final int sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}
