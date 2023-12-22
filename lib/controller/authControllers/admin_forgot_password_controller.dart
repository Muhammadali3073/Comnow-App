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
  }) {
    loadingAdminEnterEmailInForgotPassword.value = true;
    loadingDialogBox(
        context!, RxBool(loadingAdminEnterEmailInForgotPassword.value));

    AuthApiServices.getAdminEnterEmailInForgotPassword(
      email: email,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminEnterEmailInForgotPassword);
      } else if (response.statusCode == 200) {
        loadingAdminEnterEmailInForgotPassword.value = false;
        Get.back();

        // Go to next screen
        selectedIndex.value = 2;

        customScaffoldMessenger(
            context, 'Check your email for password recovery code');
      } else if (response.statusCode == 500) {
        loadingAdminEnterEmailInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.');
      } else {
        loadingAdminEnterEmailInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Admin Enter OTP In Forgot Password
  handleEnterOTPInForgotPassword(
    BuildContext? context, {
    email,
    otp,
  }) {
    loadingAdminEnterOTPInForgotPassword.value = true;
    loadingDialogBox(
        context!, RxBool(loadingAdminEnterOTPInForgotPassword.value));

    AuthApiServices.getAdminEnterOTPInForgotPassword(
      email: email,
      opt: otp,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminEnterOTPInForgotPassword);
      } else if (response.statusCode == 200) {
        loadingAdminEnterOTPInForgotPassword.value = false;
        Get.back();

        // Go to next screen
        selectedIndex.value = 3;
      } else if (response.statusCode == 500) {
        loadingAdminEnterOTPInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.');
      } else {
        loadingAdminEnterOTPInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Admin Reset Password In Forgot Password
  handleResetPasswordInForgotPassword(
    BuildContext? context, {
    email,
    newPassword,
  }) {
    loadingAdminResetPasswordInForgotPassword.value = true;
    loadingDialogBox(
        context!, RxBool(loadingAdminResetPasswordInForgotPassword.value));

    AuthApiServices.getAdminResetPasswordInForgotPassword(
      email: email,
      newPassword: newPassword,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingAdminResetPasswordInForgotPassword);
      } else if (response.statusCode == 200) {
        loadingAdminResetPasswordInForgotPassword.value = false;
        Get.back();

        // Go to next screen
        Get.offAll(() => const LoginScreen());
        selectedIndex.value = 1;

        customScaffoldMessenger(context, 'Change password successfully');
      } else if (response.statusCode == 500) {
        loadingAdminResetPasswordInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.');
      } else {
        loadingAdminResetPasswordInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
