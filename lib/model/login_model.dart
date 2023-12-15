// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data? data;
  bool? success;
  String? message;

  LoginModel({
    this.data,
    this.success,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  Subscription? subscription;
  bool? isOnline;
  bool? deleted;
  bool? blocked;
  List<String>? provider;
  List<dynamic>? team;
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
    this.deleted,
    this.blocked,
    this.provider,
    this.team,
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
    deleted: json["deleted"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<String>.from(json["provider"]!.map((x) => x)),
    team: json["team"] == null ? [] : List<dynamic>.from(json["team"]!.map((x) => x)),
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
    "deleted": deleted,
    "blocked": blocked,
    "provider": provider == null ? [] : List<dynamic>.from(provider!.map((x) => x)),
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x)),
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
