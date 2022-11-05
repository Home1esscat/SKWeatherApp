class CitiesSuggestionsModel {
  int? count;
  List<CityList>? list;

  CitiesSuggestionsModel({this.count, this.list});

  CitiesSuggestionsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['list'] != null) {
      list = <CityList>[];
      json['list'].forEach((v) {
        list!.add(CityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityList {
  int? id;
  String? name;
  Sys? sys;

  CityList({
    this.id,
    this.name,
    this.sys,
  });

  CityList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }

    return data;
  }
}

class Sys {
  String? country;

  Sys({this.country});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = country;
    return data;
  }
}
