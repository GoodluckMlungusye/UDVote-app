
// STATISTICS YEARS

// To parse this JSON data, do
//
//     final years = yearsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Years yearsFromJson(String str) => Years.fromJson(json.decode(str));

String yearsToJson(Years data) => json.encode(data.toJson());

class Years {
  final List<int> getYears;

  Years({
    required this.getYears,
  });

  factory Years.fromJson(Map<String, dynamic> json) => Years(
    getYears: List<int>.from(json["getYears"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "getYears": List<dynamic>.from(getYears.map((x) => x)),
  };
}





// COLLEGE INFO

// To parse this JSON data, do
//
//     final collegeInfo = collegeInfoFromJson(jsonString);

CollegeInfo collegeInfoFromJson(String str) => CollegeInfo.fromJson(json.decode(str));

String collegeInfoToJson(CollegeInfo data) => json.encode(data.toJson());

class CollegeInfo {
  final List<CollegeStat> collegeStats;

  CollegeInfo({
    required this.collegeStats,
  });

  factory CollegeInfo.fromJson(Map<String, dynamic> json) => CollegeInfo(
    collegeStats: List<CollegeStat>.from(json["collegeStats"].map((x) => CollegeStat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "collegeStats": List<dynamic>.from(collegeStats.map((x) => x.toJson())),
  };
}

class CollegeStat {
  final int id;
  final int collegeId;
  final int year;
  final int registeredStudents;
  final int votedStudents;
  final int universalContestants;
  final int rating;
  final DateTime createdAt;
  final DateTime updatedAt;
  final College college;

  CollegeStat({
    required this.id,
    required this.collegeId,
    required this.year,
    required this.registeredStudents,
    required this.votedStudents,
    required this.universalContestants,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.college,
  });

  factory CollegeStat.fromJson(Map<String, dynamic> json) => CollegeStat(
    id: json["id"],
    collegeId: json["college_id"],
    year: json["year"],
    registeredStudents: json["registered_students"],
    votedStudents: json["voted_students"],
    universalContestants: json["universal_contestants"],
    rating: json["rating"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    college: College.fromJson(json["college"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "college_id": collegeId,
    "year": year,
    "registered_students": registeredStudents,
    "voted_students": votedStudents,
    "universal_contestants": universalContestants,
    "rating": rating,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "college": college.toJson(),
  };
}

class College {
  final int id;
  final String collegeName;
  final String collegeImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  College({
    required this.id,
    required this.collegeName,
    required this.collegeImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory College.fromJson(Map<String, dynamic> json) => College(
    id: json["id"],
    collegeName: json["college_name"],
    collegeImage: json["college_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "college_name": collegeName,
    "college_image": collegeImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
