// To parse this JSON data, do
//
//     final categoryContestants = categoryContestantsFromJson(jsonString);

import 'dart:convert';

CategoryContestants categoryContestantsFromJson(String str) => CategoryContestants.fromJson(json.decode(str));

String categoryContestantsToJson(CategoryContestants data) => json.encode(data.toJson());

class CategoryContestants {
  final List<CategoryContestant> categoryContestants;

  CategoryContestants({
    required this.categoryContestants,
  });

  factory CategoryContestants.fromJson(Map<String, dynamic> json) => CategoryContestants(
    categoryContestants: List<CategoryContestant>.from(json["categoryContestants"].map((x) => CategoryContestant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categoryContestants": List<dynamic>.from(categoryContestants.map((x) => x.toJson())),
  };
}

class CategoryContestant {
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
  final String categoryName;
  final String categoryAbbreviation;
  final int numberOfContestants;
  final int voterId;
  final int categoryId;
  final String slogan;
  final String videoUrl;
  final int numberOfVotes;
  final College college;

  CategoryContestant({
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
    required this.categoryName,
    required this.categoryAbbreviation,
    required this.numberOfContestants,
    required this.voterId,
    required this.categoryId,
    required this.slogan,
    required this.videoUrl,
    required this.numberOfVotes,
    required this.college,
  });

  factory CategoryContestant.fromJson(Map<String, dynamic> json) => CategoryContestant(
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
    categoryName: json["category_name"],
    categoryAbbreviation: json["category_abbreviation"],
    numberOfContestants: json["number_of_contestants"],
    voterId: json["voter_id"],
    categoryId: json["category_id"],
    slogan: json["slogan"],
    videoUrl: json["video_url"],
    numberOfVotes: json["number_of_votes"],
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
    "category_name": categoryName,
    "category_abbreviation": categoryAbbreviation,
    "number_of_contestants": numberOfContestants,
    "voter_id": voterId,
    "category_id": categoryId,
    "slogan": slogan,
    "video_url": videoUrl,
    "number_of_votes": numberOfVotes,
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
