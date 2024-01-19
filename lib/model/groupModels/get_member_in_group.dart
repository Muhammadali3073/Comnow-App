// To parse this JSON data, do
//
//     final membersModel = membersModelFromJson(jsonString);

import 'dart:convert';

MembersModel membersModelFromJson(String str) => MembersModel.fromJson(json.decode(str));

String membersModelToJson(MembersModel data) => json.encode(data.toJson());

class MembersModel {
  Data? data;
  bool? success;
  String? message;

  MembersModel({
    this.data,
    this.success,
    this.message,
  });

  factory MembersModel.fromJson(Map<String, dynamic> json) => MembersModel(
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
  List<TeamMember>? teamMembers;

  Data({
    this.teamMembers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    teamMembers: json["teamMembers"] == null ? [] : List<TeamMember>.from(json["teamMembers"]!.map((x) => TeamMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "teamMembers": teamMembers == null ? [] : List<dynamic>.from(teamMembers!.map((x) => x.toJson())),
  };
}

class TeamMember {
  String? id;
  Subscription? subscription;
  bool? isOnline;
  bool? leavedTeam;
  bool? leavedGroup;
  bool? blocked;
  List<String>? provider;
  String? defaultTeam;
  List<String>? team;
  String? email;
  String? initials;
  String? userType;
  String? fullName;
  String? userName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? rank;
  EnrollmentCode? enrollmentCode;
  String? color;

  TeamMember({
    this.id,
    this.subscription,
    this.isOnline,
    this.leavedTeam,
    this.leavedGroup,
    this.blocked,
    this.provider,
    this.defaultTeam,
    this.team,
    this.email,
    this.initials,
    this.userType,
    this.fullName,
    this.userName,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rank,
    this.enrollmentCode,
    this.color,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
    id: json["_id"],
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    isOnline: json["isOnline"],
    leavedTeam: json["leavedTeam"],
    leavedGroup: json["leavedGroup"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<String>.from(json["provider"]!.map((x) => x)),
    defaultTeam: json["defaultTeam"],
    team: json["team"] == null ? [] : List<String>.from(json["team"]!.map((x) => x)),
    email: json["email"],
    initials: json["initials"],
    userType: json["userType"],
    fullName: json["fullName"],
    userName: json["userName"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    rank: json["rank"],
    enrollmentCode: json["enrollmentCode"] == null ? null : EnrollmentCode.fromJson(json["enrollmentCode"]),
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "subscription": subscription?.toJson(),
    "isOnline": isOnline,
    "leavedTeam": leavedTeam,
    "leavedGroup": leavedGroup,
    "blocked": blocked,
    "provider": provider == null ? [] : List<dynamic>.from(provider!.map((x) => x)),
    "defaultTeam": defaultTeam,
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x)),
    "email": email,
    "initials": initials,
    "userType": userType,
    "fullName": fullName,
    "userName": userName,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "rank": rank,
    "enrollmentCode": enrollmentCode?.toJson(),
    "color": color,
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
  String? subscription;
  bool? isSubscribed;
  DateTime? expiry;
  DateTime? subscriptionTime;

  Subscription({
    this.subscription,
    this.isSubscribed,
    this.expiry,
    this.subscriptionTime,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    subscription: json["subscription"],
    isSubscribed: json["isSubscribed"],
    expiry: json["expiry"] == null ? null : DateTime.parse(json["expiry"]),
    subscriptionTime: json["subscriptionTime"] == null ? null : DateTime.parse(json["subscriptionTime"]),
  );

  Map<String, dynamic> toJson() => {
    "subscription": subscription,
    "isSubscribed": isSubscribed,
    "expiry": expiry?.toIso8601String(),
    "subscriptionTime": subscriptionTime?.toIso8601String(),
  };
}
