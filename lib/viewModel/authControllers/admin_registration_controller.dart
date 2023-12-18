import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../view/authScreens/adminAuthScreens/login_screen.dart';
import '../../view/widgets/widget_utils.dart';

class AdminRegistrationController extends GetxController {
  var loadingAdminRegistration = false.obs;

  // Admin registration
  handleAdminRegister(
    BuildContext? context, {
    password,
    email,
    userName,
    fullName,
    initials,
  }) async {
    loadingAdminRegistration.value = true;
    loadingDialogBox(context!, RxBool(loadingAdminRegistration.value));

    AuthApiServices.getAdminRegistration(
      email: email,
      userName: userName,
      fullName: fullName,
      initials: initials,
      password: password,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingAdminRegistration);
      } else if (response.statusCode == 200) {
        loadingAdminRegistration.value = false;
        Get.back();

        // Go to next screen
        Get.offAll(() => const LoginScreen());

        customScaffoldMessenger(context, jsonData['message']);
      } else if (response.statusCode == 500) {
        loadingAdminRegistration.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.');
      } else {
        loadingAdminRegistration.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
