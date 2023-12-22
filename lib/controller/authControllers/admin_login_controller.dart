import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../view/navBarScreen/admin_nav_bar_screen.dart';
import '../../view/widgets/widget_utils.dart';

class AdminLoginController extends GetxController {
  var loadingAdminLogin = false.obs;
  late LoginModel loginModel;

  sharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Save Token and IsLogin in SharedPreferences
    sharedPreferences.setString('token', loginModel.data!.token!);
    sharedPreferences.setBool('isAdminLogin', loginModel.success!);

    log('User Login Status: ${sharedPreferences.getBool('isAdminLogin')}');
    log('User Login Token: ${sharedPreferences.getString('token')}');
  }

  // Admin Login
  handleAdminLogin(
    BuildContext? context, {
    password,
    email,
    language,
  }) {
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

        sharedPreferences();

        // Go to next screen
        Get.offAll(() => const AdminBottomNavigationBarScreen());

        customScaffoldMessenger(context, 'User login Success');
      } else if (response.statusCode == 500) {
        loadingAdminLogin.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.');
      } else {
        loadingAdminLogin.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
