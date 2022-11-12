class CitiesSuggestionsModel {
  int count;
  List<CityList> list;

  CitiesSuggestionsModel({required this.count, required this.list});

  factory CitiesSuggestionsModel.fromJson(Map<String, dynamic> json) {
    final cities =
        (json['list'] as List).map((e) => CityList.fromJson(e)).toList();
    return CitiesSuggestionsModel(count: json['count'], list: cities);
  }
}

class CityList {
  int id;
  String name;
  Sys sys;

  CityList({
    required this.id,
    required this.name,
    required this.sys,
  });

  factory CityList.fromJson(Map<String, dynamic> json) {
    final sys = Sys.fromJson(json['sys']);
    return CityList(id: json['id'], name: json['name'], sys: sys);
  }
}

class Sys {
  String country;

  Sys({required this.country});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(country: json['country']);
  }
}
