// To parse this JSON data, do
//
//     final adminProfileModel = adminProfileModelFromJson(jsonString);

import 'dart:convert';

AdminProfileModel adminProfileModelFromJson(String str) => AdminProfileModel.fromJson(json.decode(str));

String adminProfileModelToJson(AdminProfileModel data) => json.encode(data.toJson());

class AdminProfileModel {
  Data? data;
  bool? success;
  String? message;

  AdminProfileModel({
    this.data,
    this.success,
    this.message,
  });

  factory AdminProfileModel.fromJson(Map<String, dynamic> json) => AdminProfileModel(
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
  Subscription? subscription;
  bool? isOnline;
  bool? leavedTeam;
  bool? leavedGroup;
  bool? blocked;
  List<String>? provider;
  String? defaultTeam;
  List<String>? team;
  String? color;
  String? email;
  String? initials;
  String? userType;
  String? fullName;
  String? userName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.subscription,
    this.isOnline,
    this.leavedTeam,
    this.leavedGroup,
    this.blocked,
    this.provider,
    this.defaultTeam,
    this.team,
    this.color,
    this.email,
    this.initials,
    this.userType,
    this.fullName,
    this.userName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    isOnline: json["isOnline"],
    leavedTeam: json["leavedTeam"],
    leavedGroup: json["leavedGroup"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<String>.from(json["provider"]!.map((x) => x)),
    defaultTeam: json["defaultTeam"],
    team: json["team"] == null ? [] : List<String>.from(json["team"]!.map((x) => x)),
    color: json["color"],
    email: json["email"],
    initials: json["initials"],
    userType: json["userType"],
    fullName: json["fullName"],
    userName: json["userName"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
    "color": color,
    "email": email,
    "initials": initials,
    "userType": userType,
    "fullName": fullName,
    "userName": userName,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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
