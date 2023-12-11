import 'dart:ui';

import 'package:comnow/utils/color_data.dart';

class DataFile {
  List<LanguageModel> languageList = [
    LanguageModel(
      "English",
    ),
    LanguageModel(
      "German",
    ),
    LanguageModel(
      "Spanish",
    ),
    LanguageModel(
      "French",
    ),
    LanguageModel(
      "Italian",
    ),
  ];

  List<UserTypeModel> userTypeList = [
    UserTypeModel(
      "Admin",
    ),
    UserTypeModel(
      "Team Member",
    ),
  ];

  List<SortModel> sortModel = [
    SortModel(
      "Ascending",
    ),
    SortModel(
      "Descending",
    ),
    SortModel(
      "Custom",
    ),
  ];

  List<MessageTemplatesModel> messageTemplatesModel = [
    MessageTemplatesModel(
      "Give me water",
      '1',
    ),
    MessageTemplatesModel(
      "Send next person",
      '2',
    ),
    MessageTemplatesModel(
      "Although a text is often a quick way to discuss matters, recruiters are often busy with their full-time job. You might follow up after a week of no response, but being patient can show you have respect for their time.",
      '3',
    ),
  ];

  List<InitialsColorModel> initialsColorModel = [
    InitialsColorModel(
      redColor,
    ),
    InitialsColorModel(
      orangeColor,
    ),
    InitialsColorModel(
      yellowColor,
    ),
    InitialsColorModel(
      greenColor,
    ),
    InitialsColorModel(
      skyBlueColor,
    ),
    InitialsColorModel(
      blueColor,
    ),
    InitialsColorModel(
      darkBlueColor,
    ),
    InitialsColorModel(
      purpleColor,
    ),
    InitialsColorModel(
      pinkColor,
    ),
  ];

  List<MemberModel> memberList = [
    MemberModel(
        "Mohsin", "Khan", "MOH", greenColor, "Online", '1', false, acceptColor),
    MemberModel("Ali", "Nawaz", "ANB", yellowColor, "Offline", '2', false,
        declineColor),
    MemberModel(
        "Raza", "Farooq", "RFQ", orangeColor, "Away", '3', true, pendingColor),
    MemberModel("Luqman", "Qasim", "ANB", yellowColor, "Left team", '4', false,
        pendingColor),
    MemberModel(
        "Zeeshan", "Rana", "RFQ", orangeColor, "Away", '5', true, declineColor),
    MemberModel(
        "Ramzan", "Ali", "RNA", blueColor, "Left team", '6', true, acceptColor),
  ];

  List<TeamMemberModel> teamMemberList = [
    TeamMemberModel(
        "Mohsin", "Khan", "MOH", greenColor, "Online", '1', acceptColor),
    TeamMemberModel(
        "Ali", "Nawaz", "ANB", yellowColor, "Offline", '2', declineColor),
    TeamMemberModel(
        "Raza", "Farooq", "RFQ", orangeColor, "Away", '3', pendingColor),
    TeamMemberModel(
        "Luqman", "Qasim", "ANB", yellowColor, "Online", '4', pendingColor),
    TeamMemberModel(
        "Zeeshan", "Rana", "RFQ", orangeColor, "Away", '5', declineColor),
    TeamMemberModel(
        "Ramzan", "Ali", "RNA", blueColor, "Online", '6', acceptColor),
  ];

  List<DayByNotificationModel> notificationModelList = [
    DayByNotificationModel("Today", [
      NotificationModel("Ali", 'ping', '23:36 Thu', false),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
    DayByNotificationModel("Yesterday", [
      NotificationModel("Ali", 'ping', '23:36 Thu', true),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
    DayByNotificationModel("11/NOV/2023", [
      NotificationModel("Ali", 'ping', '23:36 Thu', true),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
    DayByNotificationModel("03/NOV/2023", [
      NotificationModel("Ali", 'ping', '23:36 Thu', true),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
  ];

  List<GroupModel> groupList = [
    GroupModel(
        "Group One",
        "2",
        [
          MemberModel("Mohsin", "Khan", "MOH", greenColor, "Online", '1', false,
              pendingColor),
          MemberModel("Ali", "Nawaz", "ANB", yellowColor, "Offline", '2', false,
              acceptColor),
        ],
        "1"),
    GroupModel(
        "Group Two",
        "3",
        [
          MemberModel("Raza", "Farooq", "RFQ", orangeColor, "Away", '3', true,
              acceptColor),
          MemberModel("Luqman", "Qasim", "ANB", yellowColor, "Left team", '4',
              false, declineColor),
          MemberModel("Zeeshan", "Rana", "RFQ", orangeColor, "Away", '5', true,
              declineColor),
        ],
        "2"),
    GroupModel(
        "Group Three",
        "1",
        [
          MemberModel("Ramzan", "Ali", "RNA", blueColor, "Left team", '6', true,
              pendingColor),
        ],
        "3"),
  ];
}

///// Models
class LanguageModel {
  String? name;

  LanguageModel(this.name);
}

///// Sort
class InitialsColorModel {
  Color? color;

  InitialsColorModel(this.color);
}

///// Sort
class SortModel {
  String? name;

  SortModel(this.name);
}

/// Gender
class UserTypeModel {
  String? name;

  UserTypeModel(this.name);
}

/// Message Templates
class MessageTemplatesModel {
  String? message;
  String? uniqueId;

  MessageTemplatesModel(this.message, this.uniqueId);
}

/// Member Model
class MemberModel {
  String? firstName;
  String? middleName;
  String? initialName;
  Color? initialBGColor;
  String? type;
  String? uniqueId;
  bool? isBlocked;
  Color? pingStatus;

  MemberModel(
      this.firstName,
      this.middleName,
      this.initialName,
      this.initialBGColor,
      this.type,
      this.uniqueId,
      this.isBlocked,
      this.pingStatus);
}

/// Member Model
class TeamMemberModel {
  String? firstName;
  String? middleName;
  String? initialName;
  Color? initialBGColor;
  String? type;
  String? uniqueId;
  Color? pingStatus;

  TeamMemberModel(this.firstName, this.middleName, this.initialName,
      this.initialBGColor, this.type, this.uniqueId, this.pingStatus);
}

/// Notification Model
class NotificationModel {
  String? firstName;
  String? type;
  String? timeOfDelivered;
  bool? isView;

  NotificationModel(
    this.firstName,
    this.type,
    this.timeOfDelivered,
    this.isView,
  );
}

/// Notification Model
class DayByNotificationModel {
  String? dateOfDelivered;
  List<NotificationModel>? notificationModel;

  DayByNotificationModel(
    this.dateOfDelivered,
    this.notificationModel,
  );
}

/// Group Model
class GroupModel {
  String? groupName;
  String? numberOfGroupMembers;
  List<MemberModel>? membersOfGroup;
  String? groupUniqueId;

  GroupModel(this.groupName, this.numberOfGroupMembers, this.membersOfGroup,
      this.groupUniqueId);
}

//// Images for Slider
final List<String> imgList = [
  'https://img.lovepik.com//back_pic/05/63/87/405b6056074ac17.jpg_wh300.jpg',
  'https://img.freepik.com/premium-vector/back-school-banner-design-illustration-background_131806-9.jpg',
  'https://img.lovepik.com/background/20211023/medium/lovepik-school-season-flat-cartoon-poster-banner-background-image_605820710.jpg'
];
