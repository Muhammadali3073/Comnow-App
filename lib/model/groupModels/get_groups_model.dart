// To parse this JSON data, do
//
//     final getGroups = getGroupsFromJson(jsonString);

import 'dart:convert';

GetGroups getGroupsFromJson(String str) => GetGroups.fromJson(json.decode(str));

String getGroupsToJson(GetGroups data) => json.encode(data.toJson());

class GetGroups {
  Data? data;
  bool? success;
  String? message;

  GetGroups({
    this.data,
    this.success,
    this.message,
  });

  factory GetGroups.fromJson(Map<String, dynamic> json) => GetGroups(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "message": message,
  };
}

class Data {
  List<Team>? teams;

  Data({
    this.teams,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    teams: json["teams"] == null ? [] : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
  };
}

class Team {
  String? id;
  String? name;
  int? users;

  Team({
    this.id,
    this.name,
    this.users,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["_id"],
    name: json["name"],
    users: json["users"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "users": users,
  };
}
