// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<Datum>? data;

  SearchModel({
    this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? title;
  String? slug;
  String? image;
  int? totalStatus;

  Datum({
    this.title,
    this.slug,
    this.image,
    this.totalStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    totalStatus: json["total_status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "slug": slug,
    "image": image,
    "total_status": totalStatus,
  };
}
