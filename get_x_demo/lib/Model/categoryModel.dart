// To parse this JSON data, do
//
//     final cAtegory = cAtegoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CAtegory> cAtegoryFromJson(String str) => List<CAtegory>.from(json.decode(str).map((x) => CAtegory.fromJson(x)));

String cAtegoryToJson(List<CAtegory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CAtegory {
  CAtegory({
    required this.id,
    required this.name,
    required this.categoryImage,
    required this.isActive,
  });

  int id;
  String name;
  String categoryImage;
  int isActive;

  factory CAtegory.fromJson(Map<String, dynamic> json) => CAtegory(
    id: json["id"],
    name: json["name"],
    categoryImage: json["category_image"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category_image": categoryImage,
    "is_active": isActive,
  };
}