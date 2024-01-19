// To parse this JSON data, do
//
//     final memberLoginModel = memberLoginModelFromJson(jsonString);

import 'dart:convert';

MemberLoginModel memberLoginModelFromJson(String str) => MemberLoginModel.fromJson(json.decode(str));

String memberLoginModelToJson(MemberLoginModel data) => json.encode(data.toJson());

class MemberLoginModel {
  Data? data;
  bool? success;
  String? message;

  MemberLoginModel({
    this.data,
    this.success,
    this.message,
  });

  factory MemberLoginModel.fromJson(Map<String, dynamic> json) => MemberLoginModel(
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
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  String? id;
  bool? isOnline;
  bool? leavedTeam;
  bool? leavedGroup;
  bool? blocked;
  List<dynamic>? provider;
  dynamic defaultTeam;
  List<Team>? team;
  String? fullName;
  String? initials;
  String? userType;
  EnrollmentCode? enrollmentCode;
  String? color;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.isOnline,
    this.leavedTeam,
    this.leavedGroup,
    this.blocked,
    this.provider,
    this.defaultTeam,
    this.team,
    this.fullName,
    this.initials,
    this.userType,
    this.enrollmentCode,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    isOnline: json["isOnline"],
    leavedTeam: json["leavedTeam"],
    leavedGroup: json["leavedGroup"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<dynamic>.from(json["provider"]!.map((x) => x)),
    defaultTeam: json["defaultTeam"],
    team: json["team"] == null ? [] : List<Team>.from(json["team"]!.map((x) => Team.fromJson(x))),
    fullName: json["fullName"],
    initials: json["initials"],
    userType: json["userType"],
    enrollmentCode: json["enrollmentCode"] == null ? null : EnrollmentCode.fromJson(json["enrollmentCode"]),
    color: json["color"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isOnline": isOnline,
    "leavedTeam": leavedTeam,
    "leavedGroup": leavedGroup,
    "blocked": blocked,
    "provider": provider == null ? [] : List<dynamic>.from(provider!.map((x) => x)),
    "defaultTeam": defaultTeam,
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x.toJson())),
    "fullName": fullName,
    "initials": initials,
    "userType": userType,
    "enrollmentCode": enrollmentCode?.toJson(),
    "color": color,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class EnrollmentCode {
  String? code;
  dynamic expiry;

  EnrollmentCode({
    this.code,
    this.expiry,
  });

  factory EnrollmentCode.fromJson(Map<String, dynamic> json) => EnrollmentCode(
    code: json["code"],
    expiry: json["expiry"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "expiry": expiry,
  };
}

class Team {
  String? id;
  bool? deleted;
  bool? team;
  String? user;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Team({
    this.id,
    this.deleted,
    this.team,
    this.user,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["_id"],
    deleted: json["deleted"],
    team: json["team"],
    user: json["user"],
    name: json["name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "deleted": deleted,
    "team": team,
    "user": user,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
