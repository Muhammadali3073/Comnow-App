import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_data.dart';

class Constants {
  static RxString selectedLanguage = "".obs;
  static RxString codeOfLanguage = "en".obs;
  static RxString tokenOfDoctor = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWE2NGEwZDM4NzhlYzAwMTg1MTNmOGIiLCJ0eXBlIjoidXNlciIsImlhdCI6MTcwNTkzMTcyMH0.rV5UwCqCtAzI6n6ENmXDInsRdG618T8d6eZe9DjX_i8".obs;
  static RxString tokenOfMember = "".obs;
  static RxString defaultTeamIdOfDoctor = "65a64a0e3878ec0018513f92".obs;
  static RxBool isSubscription = false.obs;

  static getRequiredDataForApis() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('isAdminLogin') == true) {
      selectedLanguage.value =
          sharedPreferences.getString('selectedLanguage') ?? 'English';
      codeOfLanguage.value =
          sharedPreferences.getString('selectedLanguageCode') ?? 'en';
      tokenOfDoctor.value = sharedPreferences.getString('token') ?? '';
      defaultTeamIdOfDoctor.value =
          sharedPreferences.getString('defaultTeamId') ?? '';
      isSubscription.value =
          sharedPreferences.getBool('isSubscription') ?? false;

      log(selectedLanguage.toString());
      log(codeOfLanguage.toString());
      log(tokenOfDoctor.toString());
      log(defaultTeamIdOfDoctor.toString());
      log(isSubscription.toString());
    } else if (sharedPreferences.getBool('isMemberLogin') == true) {
      selectedLanguage.value =
          sharedPreferences.getString('selectedLanguage') ?? 'English';
      codeOfLanguage.value =
          sharedPreferences.getString('selectedLanguageCode') ?? 'en';
      tokenOfMember.value = sharedPreferences.getString('memberToken') ?? '';


      log(selectedLanguage.toString());
      log(codeOfLanguage.toString());
      log(tokenOfMember.toString());
    }
  }

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
