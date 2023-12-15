import 'dart:convert';
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

  // Admin Login
  handleAdminLogin(
    BuildContext? context, {
    password,
    email,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    loadingAdminLogin.value = true;

    AuthApiServices.getAdminLogin(
      email: email,
      password: password,
      language: "en",
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminLogin);
      } else if (response.statusCode == 200) {
        // Add Data to Model
        loginModel = loginModelFromJson(response.body.toString());

        // Save Token and IsLogin in SharedPreferences
        sharedPreferences.setString('token', loginModel.data!.token!);
        sharedPreferences.setBool('isAdminLogin', loginModel.success!);

        // Go to next screen
        Get.offAll(() => const AdminBottomNavigationBarScreen());

        loadingAdminLogin.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      } else {
        loadingAdminLogin.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      }
    });
  }
}
