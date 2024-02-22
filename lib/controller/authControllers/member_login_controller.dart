import 'dart:convert';
import 'dart:developer';
import 'package:comnow/view/navBarScreen/team_member_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/authModels/member_login_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../utils/constant.dart';
import '../../view/widgets/widget_utils.dart';

class MemberLoginController extends GetxController {
  var loadingMemberLogin = false.obs;
  Rxn<MemberLoginModel> loginModel = Rxn<MemberLoginModel>();

  sharedPreferences(token, success) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Save Token and IsLogin in SharedPreferences
    sharedPreferences.setString('memberToken', token);
    sharedPreferences.setBool('isMemberLogin', success);

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
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingMemberLogin);
      } else if (response.statusCode == 200) {
        // Add Data to Model
        loginModel.value = memberLoginModelFromJson(response.body);

        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            loadingMemberLogin.value = false;
            Get.back();

            sharedPreferences(
                loginModel.value!.data!.token, loginModel.value!.success);

            Constants.getRequiredDataForApis();

            // Go to next screen
            Get.offAll(() => const TeamMemberBottomNavigationBarScreen());

            customScaffoldMessenger(context, 'User login Success'.tr);
          },
        );
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
