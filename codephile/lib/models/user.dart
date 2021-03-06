import 'dart:convert';

import 'package:codephile/models/submission.dart';
import 'package:codephile/models/user_profile_details.dart';

CodephileUser userFromJson(String str) =>
    CodephileUser.fromJson(json.decode(str));

String userToJson(CodephileUser data) => json.encode(data.toJson());

class CodephileUser {
  String fullname;
  String email;
  Handle handle;
  String id;
  String institute;
  int noOfFollowing;
  String picture;
  UserProfileDetails profiles;
  List<Submission> recentSubmissions;
  String username;
  SolvedProblemsCount solvedProblemsCount;

  CodephileUser({
    this.fullname,
    this.email,
    this.handle,
    this.id,
    this.institute,
    this.noOfFollowing,
    this.picture,
    this.profiles,
    this.recentSubmissions,
    this.username,
    this.solvedProblemsCount,
  });

  factory CodephileUser.fromJson(Map<String, dynamic> json) => CodephileUser(
        fullname: json["fullname"],
        email: json['email'],
        handle: Handle.fromJson(json["handle"]),
        id: json["id"],
        institute: json["institute"],
        noOfFollowing: json["no_of_following"],
        picture: json["picture"],
        profiles: (json["profiles"] == null)
            ? null
            : UserProfileDetails.fromJson(json["profiles"]),
        recentSubmissions: (json["recent_submissions"] == null)
            ? null
            : List<Submission>.from(
                json["recent_submissions"].map((x) => Submission.fromJson(x))),
        username: json["username"],
        solvedProblemsCount: (json["solved_problems_count"] == null)
            ? null
            : SolvedProblemsCount.fromJson(json["solved_problems_count"]),
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "handle": handle.toJson(),
        "id": id,
        "institute": institute,
        "no_of_following": noOfFollowing,
        "picture": picture,
        "profiles": (profiles != null) ? profiles.toJson() : null,
        "recent_submissions": (recentSubmissions != null)
            ? List<dynamic>.from(recentSubmissions.map((x) => x.toJson()))
            : null,
        "username": username,
        "solved_problems_count":
            (solvedProblemsCount != null) ? solvedProblemsCount.toJson() : null,
      };
}

class Handle {
  String codechef;
  String codeforces;
  String hackerearth;
  String hackerrank;
  String spoj;

  Handle({
    this.codechef,
    this.codeforces,
    this.hackerearth,
    this.hackerrank,
    this.spoj,
  });

  factory Handle.fromJson(Map<String, dynamic> json) => Handle(
        codechef: json["codechef"],
        codeforces: json["codeforces"],
        hackerearth: json["hackerearth"],
        hackerrank: json["hackerrank"],
        spoj: json["spoj"],
      );

  Map<String, dynamic> toJson() => {
        "codechef": codechef,
        "codeforces": codeforces,
        "hackerearth": hackerearth,
        "hackerrank": hackerrank,
        "spoj": spoj,
      };
}

class SolvedProblemsCount {
  SolvedProblemsCount({
    this.codechef,
    this.codeforces,
    this.hackerrank,
    this.spoj,
  });

  int codechef;
  int codeforces;
  int hackerrank;
  int spoj;

  factory SolvedProblemsCount.fromJson(Map<String, dynamic> json) =>
      SolvedProblemsCount(
        codechef: json["codechef"],
        codeforces: json["codeforces"],
        hackerrank: json["hackerrank"],
        spoj: json["spoj"],
      );

  Map<String, dynamic> toJson() => {
        "codechef": codechef,
        "codeforces": codeforces,
        "hackerrank": hackerrank,
        "spoj": spoj,
      };
}
