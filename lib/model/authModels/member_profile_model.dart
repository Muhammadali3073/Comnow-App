// To parse this JSON data, do
//
//     final memberDataModel = memberDataModelFromJson(jsonString);

import 'dart:convert';

MemberDataModel memberDataModelFromJson(String str) => MemberDataModel.fromJson(json.decode(str));

String memberDataModelToJson(MemberDataModel data) => json.encode(data.toJson());

class MemberDataModel {
  Data? data;
  bool? success;
  String? message;

  MemberDataModel({
    this.data,
    this.success,
    this.message,
  });

  factory MemberDataModel.fromJson(Map<String, dynamic> json) => MemberDataModel(
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

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
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
  List<String>? team;
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
    team: json["team"] == null ? [] : List<String>.from(json["team"]!.map((x) => x)),
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
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x)),
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
