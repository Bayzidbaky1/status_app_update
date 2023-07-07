// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    List<Datum>? data;

    CategoryModel({
        this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
