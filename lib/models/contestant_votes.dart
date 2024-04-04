// To parse this JSON data, do
//
//     final votes = votesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Votes votesFromJson(String str) => Votes.fromJson(json.decode(str));

String votesToJson(Votes data) => json.encode(data.toJson());

class Votes {
  final int countContestantVotes;

  Votes({
    required this.countContestantVotes,
  });

  factory Votes.fromJson(Map<String, dynamic> json) => Votes(
    countContestantVotes: json["countContestantVotes"],
  );

  Map<String, dynamic> toJson() => {
    "countContestantVotes": countContestantVotes,
  };
}
