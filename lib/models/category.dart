// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final List<Category> categories;

  Categories({
    required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  final int id;
  final String categoryName;
  final String categoryAbbreviation;
  final int numberOfContestants;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryAbbreviation,
    required this.numberOfContestants,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    categoryAbbreviation: json["category_abbreviation"],
    numberOfContestants: json["number_of_contestants"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_abbreviation": categoryAbbreviation,
    "number_of_contestants": numberOfContestants,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
