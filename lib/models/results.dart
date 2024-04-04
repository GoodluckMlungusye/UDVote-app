// To parse this JSON data, do
//
//     final results = resultsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  final int countVoters;
  final List<DisplayContestant> displayContestants;
  final int countContestants;
  final int countCategoryTotalVotes;

  Results({
    required this.countVoters,
    required this.displayContestants,
    required this.countContestants,
    required this.countCategoryTotalVotes,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    countVoters: json["countVoters"],
    displayContestants: List<DisplayContestant>.from(json["displayContestants"].map((x) => DisplayContestant.fromJson(x))),
    countContestants: json["countContestants"],
    countCategoryTotalVotes: json["countCategoryTotalVotes"],
  );

  Map<String, dynamic> toJson() => {
    "countVoters": countVoters,
    "displayContestants": List<dynamic>.from(displayContestants.map((x) => x.toJson())),
    "countContestants": countContestants,
    "countCategoryTotalVotes": countCategoryTotalVotes,
  };
}

class DisplayContestant {
  final int id;
  final int collegeId;
  final String firstName;
  final String secondName;
  final String lastName;
  final String registrationNumber;
  final String voterEmail;
  final String voterContact;
  final String voterImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final College college;

  DisplayContestant({
    required this.id,
    required this.collegeId,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.registrationNumber,
    required this.voterEmail,
    required this.voterContact,
    required this.voterImage,
    required this.createdAt,
    required this.updatedAt,
    required this.college,
  });

  factory DisplayContestant.fromJson(Map<String, dynamic> json) => DisplayContestant(
    id: json["id"],
    collegeId: json["college_id"],
    firstName: json["first_name"],
    secondName: json["second_name"],
    lastName: json["last_name"],
    registrationNumber: json["registration_number"],
    voterEmail: json["voter_email"],
    voterContact: json["voter_contact"],
    voterImage: json["voter_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    college: College.fromJson(json["college"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "college_id": collegeId,
    "first_name": firstName,
    "second_name": secondName,
    "last_name": lastName,
    "registration_number": registrationNumber,
    "voter_email": voterEmail,
    "voter_contact": voterContact,
    "voter_image": voterImage,
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
