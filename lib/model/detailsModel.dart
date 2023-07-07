// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

class DetailsModel {
    List<Datum>? data;

    DetailsModel({
        this.data,
    });

    factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
}

class Datum {
    String? title;
    String? slug;
    String? image;
    String? category;

    Datum({
        this.title,
        this.slug,
        this.image,
        this.category,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        category: json["category"],
    );

}

