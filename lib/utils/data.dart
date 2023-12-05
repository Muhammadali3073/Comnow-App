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
    MemberModel("Mohsin", "Khan", "MOH", greenColor, "Online", '1', false),
    MemberModel("Ali", "Nawaz", "ANB", yellowColor, "Offline", '2', false),
    MemberModel("Raza", "Farooq", "RFQ", orangeColor, "Away", '3', true),
    MemberModel("Luqman", "Qasim", "ANB", yellowColor, "Left team", '4', false),
    MemberModel("Zeeshan", "Rana", "RFQ", orangeColor, "Away", '5', true),
    MemberModel("Ramzan", "Ali", "RNA", blueColor, "Left team", '6', true),
  ];

  List<GroupModel> groupList = [
    GroupModel(
        "Group One",
        "2",
        [
          MemberModel(
              "Mohsin", "Khan", "MOH", greenColor, "Online", '1', false),
          MemberModel(
              "Ali", "Nawaz", "ANB", yellowColor, "Offline", '2', false),
        ],
        "1"),
    GroupModel(
        "Group Two",
        "3",
        [
          MemberModel("Raza", "Farooq", "RFQ", orangeColor, "Away", '3', true),
          MemberModel(
              "Luqman", "Qasim", "ANB", yellowColor, "Left team", '4', false),
          MemberModel("Zeeshan", "Rana", "RFQ", orangeColor, "Away", '5', true),
        ],
        "2"),
    GroupModel(
        "Group Three",
        "1",
        [
          MemberModel(
              "Ramzan", "Ali", "RNA", blueColor, "Left team", '6', true),
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

/// Member Model
class MemberModel {
  String? firstName;
  String? middleName;
  String? initialName;
  Color? initialBGColor;
  String? type;
  String? uniqueId;
  bool? isBlocked;

  MemberModel(this.firstName, this.middleName, this.initialName,
      this.initialBGColor, this.type, this.uniqueId, this.isBlocked);
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
