import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../view/authScreens/adminAuthScreens/login_screen.dart';
import '../../view/widgets/widget_utils.dart';

class AdminForgotPasswordController extends GetxController {
  var loadingAdminEnterEmailInForgotPassword = false.obs;
  var loadingAdminEnterOTPInForgotPassword = false.obs;
  var loadingAdminResetPasswordInForgotPassword = false.obs;
  var selectedIndex = 1.obs;

  // Admin Enter Email In Forgot Password
  handleEnterEmailInForgotPassword(
    BuildContext? context, {
    email,
  }) async {
    loadingAdminEnterEmailInForgotPassword.value = true;

    AuthApiServices.getAdminEnterEmailInForgotPassword(
      email: email,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminEnterEmailInForgotPassword);
      } else if (response.statusCode == 200) {
        // Go to next screen
        selectedIndex.value = 2;

        loadingAdminEnterEmailInForgotPassword.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      } else {
        loadingAdminEnterEmailInForgotPassword.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      }
    });
  }

  // Admin Enter OTP In Forgot Password
  handleEnterOTPInForgotPassword(
    BuildContext? context, {
    email,
    otp,
  }) async {
    loadingAdminEnterOTPInForgotPassword.value = true;

    AuthApiServices.getAdminEnterOTPInForgotPassword(
      email: email,
      opt: otp,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminEnterOTPInForgotPassword);
      } else if (response.statusCode == 200) {
        // Go to next screen
        selectedIndex.value = 3;

        loadingAdminEnterOTPInForgotPassword.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      } else {
        loadingAdminEnterOTPInForgotPassword.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      }
    });
  }

  // Admin Reset Password In Forgot Password
  handleResetPasswordInForgotPassword(
    BuildContext? context, {
    email,
    newPassword,
  }) async {
    loadingAdminResetPasswordInForgotPassword.value = true;

    AuthApiServices.getAdminResetPasswordInForgotPassword(
      email: email,
      newPassword: newPassword,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminResetPasswordInForgotPassword);
      } else if (response.statusCode == 200) {
        // Go to next screen
        Get.to(() => const LoginScreen());
        selectedIndex.value = 1;

        loadingAdminResetPasswordInForgotPassword.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      } else {
        loadingAdminResetPasswordInForgotPassword.value = false;
        customScaffoldMessenger(context!, jsonData['message']);
      }
    });
  }
}
