import 'dart:convert';
import 'package:comnow/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/authModels/admin_login_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../view/navBarScreen/admin_nav_bar_screen.dart';
import '../../view/widgets/widget_utils.dart';

class AdminLoginController extends GetxController {
  var loadingAdminLogin = false.obs;
  late LoginAdminModel loginModel;

  sharedPreferences(token, success, defaultTeam) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Save Token and IsLogin in SharedPreferences
    sharedPreferences.setString('token', token);
    sharedPreferences.setBool('isAdminLogin', success);
    sharedPreferences.setString('defaultTeamId', defaultTeam);
  }

  // Admin Login
  handleAdminLogin(
    BuildContext? context, {
    password,
    email,
    language,
  })  {
    loadingAdminLogin.value = true;
    loadingDialogBox(context!, RxBool(loadingAdminLogin.value));

    AuthApiServices.getAdminLogin(
      email: email,
      password: password,
      language: language,
    ).then((response) {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminLogin);
      } else if (response.statusCode == 200) {
        loadingAdminLogin.value = false;
        Get.back();

        // Add Data to Model
        loginModel = loginModelFromJson(response.body.toString());

        if (loginModel.data != null) {
          sharedPreferences(
            loginModel.data!.token,
            loginModel.success,
            loginModel.data!.user!.defaultTeam,
          );

          Constants.getRequiredDataForApis();

          // Go to next screen
          Get.offAll(() => const AdminBottomNavigationBarScreen());
          customScaffoldMessenger(context, 'User login Success'.tr);
        }
      } else if (response.statusCode == 500) {
        loadingAdminLogin.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingAdminLogin.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
