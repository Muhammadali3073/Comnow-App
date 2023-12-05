class Constant {
  static String assetPngPath = "assets/png/";
  static String svgImagePath = "assets/svg/";
  static bool isDriverApp = false;
  static const String fontsFamilyRegular = "Roboto-Regular";
  static const String fontsFamilyMedium = "Roboto-Medium";
  static const String fontsFamilyBold = "Roboto-Bold";
}

enum OptionsForAllMembers {
  addMember,
  pingToAll,
  sendMessageToAll,
  sendVoiceTolAll,
  sort
}

enum OptionsForGroups {
  addMember,
  pingToAll,
  sendMessageToAll,
  sendVoiceTolAll,
  deleteGroup,
  sort,
  rename
}
