// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);

import 'dart:convert';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Places {
  List<PlaceSubCategory>? subCategory;
  String? id;
  String? category;

  Places({
    this.subCategory,
    this.id,
    this.category,
  });

  factory Places.fromJson(Map<String, dynamic> json) => Places(
    subCategory: json["sub_category"] == null ? [] : List<PlaceSubCategory>.from(json["sub_category"]!.map((x) => PlaceSubCategory.fromJson(x))),
    id: json["id"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "sub_category": subCategory == null ? [] : List<dynamic>.from(subCategory!.map((x) => x.toJson())),
    "id": id,
    "category": category,
  };
}

class PlaceSubCategory {
  List<City>? city;
  String? name;
  String? id;
  bool isSelected;

  PlaceSubCategory({
    this.city,
    this.name,
    this.id,
    this.isSelected = false
  });

  factory PlaceSubCategory.fromJson(Map<String, dynamic> json) => PlaceSubCategory(
    city: json["city"] == null ? [] : List<City>.from(json["city"]!.map((x) => City.fromJson(x))),
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "city": city == null ? [] : List<dynamic>.from(city!.map((x) => x.toJson())),
    "name": name,
    "id": id,
  };
}

class City {
  String? name;
  String? photo;
  String? desc;

  City({
    this.name,
    this.photo,
    this.desc,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    name: json["name"],
    photo: json["photo"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photo": photo,
    "desc": desc,
  };


}
