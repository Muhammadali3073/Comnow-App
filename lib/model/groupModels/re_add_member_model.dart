// To parse this JSON data, do
//
//     final reAddMemberDataModel = reAddMemberDataModelFromJson(jsonString);

import 'dart:convert';

ReAddMemberDataModel reAddMemberDataModelFromJson(String str) => ReAddMemberDataModel.fromJson(json.decode(str));

String reAddMemberDataModelToJson(ReAddMemberDataModel data) => json.encode(data.toJson());

class ReAddMemberDataModel {
  Data? data;
  bool? success;
  String? message;

  ReAddMemberDataModel({
    this.data,
    this.success,
    this.message,
  });

  factory ReAddMemberDataModel.fromJson(Map<String, dynamic> json) => ReAddMemberDataModel(
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
  EnrollmentCode? enrollmentCode;
  Subscription? subscription;
  bool? isOnline;
  bool? leavedTeam;
  bool? leavedGroup;
  bool? blocked;
  List<dynamic>? provider;
  dynamic defaultTeam;
  List<String>? team;
  bool? isVerified;
  dynamic emailVerificationToken;
  String? id;
  String? fullName;
  String? initials;
  String? userType;
  String? color;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.enrollmentCode,
    this.subscription,
    this.isOnline,
    this.leavedTeam,
    this.leavedGroup,
    this.blocked,
    this.provider,
    this.defaultTeam,
    this.team,
    this.isVerified,
    this.emailVerificationToken,
    this.id,
    this.fullName,
    this.initials,
    this.userType,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    enrollmentCode: json["enrollmentCode"] == null ? null : EnrollmentCode.fromJson(json["enrollmentCode"]),
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    isOnline: json["isOnline"],
    leavedTeam: json["leavedTeam"],
    leavedGroup: json["leavedGroup"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<dynamic>.from(json["provider"]!.map((x) => x)),
    defaultTeam: json["defaultTeam"],
    team: json["team"] == null ? [] : List<String>.from(json["team"]!.map((x) => x)),
    isVerified: json["isVerified"],
    emailVerificationToken: json["emailVerificationToken"],
    id: json["_id"],
    fullName: json["fullName"],
    initials: json["initials"],
    userType: json["userType"],
    color: json["color"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "enrollmentCode": enrollmentCode?.toJson(),
    "subscription": subscription?.toJson(),
    "isOnline": isOnline,
    "leavedTeam": leavedTeam,
    "leavedGroup": leavedGroup,
    "blocked": blocked,
    "provider": provider == null ? [] : List<dynamic>.from(provider!.map((x) => x)),
    "defaultTeam": defaultTeam,
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x)),
    "isVerified": isVerified,
    "emailVerificationToken": emailVerificationToken,
    "_id": id,
    "fullName": fullName,
    "initials": initials,
    "userType": userType,
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
