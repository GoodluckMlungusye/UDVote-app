// To parse this JSON data, do
//
// final motivators = motivatorsFromJson(jsonString);

import 'dart:convert';

Motivators motivatorsFromJson(String str) => Motivators.fromJson(json.decode(str));

String motivatorsToJson(Motivators data) => json.encode(data.toJson());

class Motivators {
  final List<Motivator> motivators;

  Motivators({
    required this.motivators,
  });

  factory Motivators.fromJson(Map<String, dynamic> json) => Motivators(
    motivators: List<Motivator>.from(json["motivators"].map((x) => Motivator.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "motivators": List<dynamic>.from(motivators.map((x) => x.toJson())),
  };
}

class Motivator {
  final int id;
  final String motivatorName;
  final String quote;
  final String motivatorImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  Motivator({
    required this.id,
    required this.motivatorName,
    required this.quote,
    required this.motivatorImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Motivator.fromJson(Map<String, dynamic> json) => Motivator(
    id: json["id"],
    motivatorName: json["motivator_name"],
    quote: json["quote"],
    motivatorImage: json["motivator_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "motivator_name": motivatorName,
    "quote": quote,
    "motivator_image": motivatorImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
