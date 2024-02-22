import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/authModels/member_profile_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../utils/color_data.dart';
import '../../view/authScreens/welcome_screen.dart';
import '../../view/widgets/widget_utils.dart';

class MemberProfileController extends GetxController {
  var loadingGetMemberProfile = false.obs;
  var loadingMemberLogout = false.obs;

  Rxn<MemberDataModel> getMemberData = Rxn<MemberDataModel>();

  logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Remove Token and IsLogin in SharedPreferences
    sharedPreferences.remove('memberToken');
    sharedPreferences.remove('isMemberLogin');

    log('User Login Status: ${sharedPreferences.getBool('isMemberLogin')}');
    log('User Login Token: ${sharedPreferences.getString('memberToken')}');

    Get.offAll(() => const WelcomeScreen());
  }

  // Get Member Profile
  handleGetMemberProfile(
    BuildContext? context, {
    language,
    token,
  }) async {
    loadingGetMemberProfile.value = true;

    ProfileApiServices.getMemberProfile(
      language,
      token: token,
    ).then((response) {
      if (response == null) {
        timeOutException(loading: loadingGetMemberProfile);
      } else if (response.statusCode == 200) {
        loadingGetMemberProfile.value = false;

        getMemberData.value = memberDataModelFromJson(response.body);

        log(getMemberData.value!.message.toString());
      } else {
        loadingGetMemberProfile.value = false;

        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      }
    });
  }

  //  Member Logout
  handleMemberLogout(
    BuildContext? context, {
    token,
    userName,
    language,
  }) async {
    loadingMemberLogout.value = true;
    loadingDialogBox(context!, RxBool(loadingMemberLogout.value));

    ProfileApiServices.memberLogout(token: token, language: language)
        .then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingMemberLogout);
      } else if (response.statusCode == 200) {
        loadingMemberLogout.value = false;
        Get.back();

        logOut();

        Fluttertoast.showToast(
            msg: "$userName logout successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingMemberLogout.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingMemberLogout.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
