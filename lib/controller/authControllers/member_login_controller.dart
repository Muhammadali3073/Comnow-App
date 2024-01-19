import 'dart:convert';
import 'dart:developer';
import 'package:comnow/view/navBarScreen/team_member_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/authModels/member_login_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../view/widgets/widget_utils.dart';

class MemberLoginController extends GetxController {
  var loadingMemberLogin = false.obs;
  late MemberLoginModel loginModel;

  sharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Save Token and IsLogin in SharedPreferences
    sharedPreferences.setString('memberToken', loginModel.data!.token!);
    sharedPreferences.setBool('isMemberLogin', loginModel.success!);

    log('User Login Status: ${sharedPreferences.getBool('isMemberLogin')}');
    log('User Login Token: ${sharedPreferences.getString('memberToken')}');
  }

  // Member Login
  handleMemberLogin(
    BuildContext? context, {
    enrollmentCode,
    language,
  }) {
    loadingMemberLogin.value = true;
    loadingDialogBox(context!, RxBool(loadingMemberLogin.value));

    AuthApiServices.getMemberLogin(
      enrollmentCode: enrollmentCode,
      language: language,
    ).then((response) {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingMemberLogin);
      } else if (response.statusCode == 200) {
        loadingMemberLogin.value = false;
        Get.back();

        // Add Data to Model
        loginModel = memberLoginModelFromJson(response.body);

        sharedPreferences();

        // Go to next screen
        Get.offAll(() => const TeamMemberBottomNavigationBarScreen());

        customScaffoldMessenger(context, 'User login Success'.tr);
      } else if (response.statusCode == 500) {
        loadingMemberLogin.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingMemberLogin.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
