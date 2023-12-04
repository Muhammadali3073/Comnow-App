import 'dart:ui';

import 'package:comnow/utils/color_data.dart';

class DataFile {
  static List<LanguageModel> languageList = [
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

  static List<UserTypeModel> userTypeList = [
    UserTypeModel(
      "Admin",
    ),
    UserTypeModel(
      "Team Member",
    ),
  ];

  static List<SortModel> sortModel = [
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

  static List<MemberModel> memberList = [
    MemberModel("Mohsin", "Khan", "MOH", greenColor, "Online", '1'),
    MemberModel("Ali", "Nawaz", "ANB", yellowColor, "Offline", '2'),
    MemberModel("Raza", "Farooq", "RFQ", orangeColor, "Away", '3'),
    MemberModel("Ramzan", "Ali", "RNA", leftMemberBGColor, "Left team", '4'),
  ];
}

///// Models
class LanguageModel {
  String? name;

  LanguageModel(this.name);
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

  MemberModel(this.firstName, this.middleName, this.initialName,
      this.initialBGColor, this.type, this.uniqueId);
}

//// Images for Slider
final List<String> imgList = [
  'https://img.lovepik.com//back_pic/05/63/87/405b6056074ac17.jpg_wh300.jpg',
  'https://img.freepik.com/premium-vector/back-school-banner-design-illustration-background_131806-9.jpg',
  'https://img.lovepik.com/background/20211023/medium/lovepik-school-season-flat-cartoon-poster-banner-background-image_605820710.jpg'
];
