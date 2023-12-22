import 'package:flutter/material.dart';

import 'color_data.dart';

class Constant {
  static String assetPngPath = "assets/png/";
  static String svgImagePath = "assets/svg/";
  static const String fontsFamilyRegular = "Roboto-Regular";
  static const String fontsFamilyMedium = "Roboto-Medium";
  static const String fontsFamilyBold = "Roboto-Bold";
  static const Gradient appGradient = LinearGradient(colors: [
    CustomColors.topBackgroundColor,
    CustomColors.bottomBackgroundColor,
    CustomColors.bottomBackgroundColor,
    CustomColors.topBackgroundColor,
  ]);
  static const Gradient authGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.center,
      colors: [
        CustomColors.topBackgroundColor,
        CustomColors.bottomBackgroundColor
      ]);
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
