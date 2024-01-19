// To parse this JSON data, do
//
//     final addMemberModel = addMemberModelFromJson(jsonString);

import 'dart:convert';

AddMemberModel addMemberModelFromJson(String str) => AddMemberModel.fromJson(json.decode(str));

String addMemberModelToJson(AddMemberModel data) => json.encode(data.toJson());

class AddMemberModel {
  Data? data;
  bool? success;
  String? message;

  AddMemberModel({
    this.data,
    this.success,
    this.message,
  });

  factory AddMemberModel.fromJson(Map<String, dynamic> json) => AddMemberModel(
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
  Subscription? subscription;
  bool? isOnline;
  bool? leavedTeam;
  bool? leavedGroup;
  bool? blocked;
  List<dynamic>? provider;
  String? defaultTeam;
  List<dynamic>? team;
  dynamic otp;
  String? id;
  String? fullName;
  String? initials;
  String? userType;
  EnrollmentCode? enrollmentCode;
  String? color;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.subscription,
    this.isOnline,
    this.leavedTeam,
    this.leavedGroup,
    this.blocked,
    this.provider,
    this.defaultTeam,
    this.team,
    this.otp,
    this.id,
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
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    isOnline: json["isOnline"],
    leavedTeam: json["leavedTeam"],
    leavedGroup: json["leavedGroup"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<dynamic>.from(json["provider"]!.map((x) => x)),
    defaultTeam: json["defaultTeam"],
    team: json["team"] == null ? [] : List<dynamic>.from(json["team"]!.map((x) => x)),
    otp: json["otp"],
    id: json["_id"],
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
    "subscription": subscription?.toJson(),
    "isOnline": isOnline,
    "leavedTeam": leavedTeam,
    "leavedGroup": leavedGroup,
    "blocked": blocked,
    "provider": provider == null ? [] : List<dynamic>.from(provider!.map((x) => x)),
    "defaultTeam": defaultTeam,
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x)),
    "otp": otp,
    "_id": id,
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

class Subscription {
  bool? isSubscribed;

  Subscription({
    this.isSubscribed,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    isSubscribed: json["isSubscribed"],
  );

  Map<String, dynamic> toJson() => {
    "isSubscribed": isSubscribed,
  };
}
