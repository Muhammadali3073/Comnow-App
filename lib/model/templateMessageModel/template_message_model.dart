// To parse this JSON data, do
//
//     final templateOfMessageModel = templateOfMessageModelFromJson(jsonString);

import 'dart:convert';

TemplateOfMessageModel templateOfMessageModelFromJson(String str) => TemplateOfMessageModel.fromJson(json.decode(str));

String templateOfMessageModelToJson(TemplateOfMessageModel data) => json.encode(data.toJson());

class TemplateOfMessageModel {
  Data? data;
  bool? success;
  String? message;

  TemplateOfMessageModel({
    this.data,
    this.success,
    this.message,
  });

  factory TemplateOfMessageModel.fromJson(Map<String, dynamic> json) => TemplateOfMessageModel(
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
  List<PredefinedMessage>? predefinedMessages;

  Data({
    this.predefinedMessages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    predefinedMessages: json["predefinedMessages"] == null ? [] : List<PredefinedMessage>.from(json["predefinedMessages"]!.map((x) => PredefinedMessage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "predefinedMessages": predefinedMessages == null ? [] : List<dynamic>.from(predefinedMessages!.map((x) => x.toJson())),
  };
}

class PredefinedMessage {
  String? id;
  bool? isActive;
  bool? isDeleted;
  String? text;
  String? team;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? rank;

  PredefinedMessage({
    this.id,
    this.isActive,
    this.isDeleted,
    this.text,
    this.team,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rank,
  });

  factory PredefinedMessage.fromJson(Map<String, dynamic> json) => PredefinedMessage(
    id: json["_id"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    text: json["text"],
    team: json["team"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "text": text,
    "team": team,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "rank": rank,
  };
}
