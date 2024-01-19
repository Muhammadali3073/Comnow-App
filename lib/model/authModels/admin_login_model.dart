// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginAdminModel loginModelFromJson(String str) => LoginAdminModel.fromJson(json.decode(str));

String loginModelToJson(LoginAdminModel data) => json.encode(data.toJson());

class LoginAdminModel {
  Data? data;
  bool? success;
  String? message;

  LoginAdminModel({
    this.data,
    this.success,
    this.message,
  });

  factory LoginAdminModel.fromJson(Map<String, dynamic> json) => LoginAdminModel(
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
  UserSubscription? subscription;
  bool? isOnline;
  bool? leavedTeam;
  bool? leavedGroup;
  bool? blocked;
  List<String>? provider;
  String? defaultTeam;
  List<Team>? team;
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
    subscription: json["subscription"] == null ? null : UserSubscription.fromJson(json["subscription"]),
    isOnline: json["isOnline"],
    leavedTeam: json["leavedTeam"],
    leavedGroup: json["leavedGroup"],
    blocked: json["blocked"],
    provider: json["provider"] == null ? [] : List<String>.from(json["provider"]!.map((x) => x)),
    defaultTeam: json["defaultTeam"],
    team: json["team"] == null ? [] : List<Team>.from(json["team"]!.map((x) => Team.fromJson(x))),
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
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x.toJson())),
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


class UserSubscription {
  SubscriptionSubscription? subscription;
  bool? isSubscribed;
  DateTime? expiry;
  DateTime? subscriptionTime;

  UserSubscription({
    this.subscription,
    this.isSubscribed,
    this.expiry,
    this.subscriptionTime,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) => UserSubscription(
    subscription: json["subscription"] == null ? null : SubscriptionSubscription.fromJson(json["subscription"]),
    isSubscribed: json["isSubscribed"],
    expiry: json["expiry"] == null ? null : DateTime.parse(json["expiry"]),
    subscriptionTime: json["subscriptionTime"] == null ? null : DateTime.parse(json["subscriptionTime"]),
  );

  Map<String, dynamic> toJson() => {
    "subscription": subscription?.toJson(),
    "isSubscribed": isSubscribed,
    "expiry": expiry?.toIso8601String(),
    "subscriptionTime": subscriptionTime?.toIso8601String(),
  };
}

class SubscriptionSubscription {
  String? id;
  String? type;
  int? maxUsers;
  int? maxTextTemplates;
  int? maxVoiceMessage;
  String? code;
  String? pricePerYear;
  String? pricePerMonth;

  SubscriptionSubscription({
    this.id,
    this.type,
    this.maxUsers,
    this.maxTextTemplates,
    this.maxVoiceMessage,
    this.code,
    this.pricePerYear,
    this.pricePerMonth,
  });

  factory SubscriptionSubscription.fromJson(Map<String, dynamic> json) => SubscriptionSubscription(
    id: json["_id"],
    type: json["type"],
    maxUsers: json["maxUsers"],
    maxTextTemplates: json["maxTextTemplates"],
    maxVoiceMessage: json["maxVoiceMessage"],
    code: json["code"],
    pricePerYear: json["pricePerYear"],
    pricePerMonth: json["pricePerMonth"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "maxUsers": maxUsers,
    "maxTextTemplates": maxTextTemplates,
    "maxVoiceMessage": maxVoiceMessage,
    "code": code,
    "pricePerYear": pricePerYear,
    "pricePerMonth": pricePerMonth,
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
    name: json["name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "deleted": deleted,
    "team": team,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
