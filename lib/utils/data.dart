class DataFile {
  static List<LanguageModel> languageList = [
    LanguageModel(
      "English",
    ),
    LanguageModel(
      "German",
    ),LanguageModel(
      "Spanish",
    ),LanguageModel(
      "French",
    ),LanguageModel(
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
}

///// Models

class LanguageModel {
  String? name;

  LanguageModel(this.name);
}

/// Gender
class UserTypeModel {
  String? name;

  UserTypeModel(this.name);
}

//// Images for Slider
final List<String> imgList = [
  'https://img.lovepik.com//back_pic/05/63/87/405b6056074ac17.jpg_wh300.jpg',
  'https://img.freepik.com/premium-vector/back-school-banner-design-illustration-background_131806-9.jpg',
  'https://img.lovepik.com/background/20211023/medium/lovepik-school-season-flat-cartoon-poster-banner-background-image_605820710.jpg'
];
