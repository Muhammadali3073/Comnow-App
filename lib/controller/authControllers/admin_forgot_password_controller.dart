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
    language,
  }) {
    loadingAdminEnterEmailInForgotPassword.value = true;
    loadingDialogBox(
        context!, RxBool(loadingAdminEnterEmailInForgotPassword.value));

    AuthApiServices.getAdminEnterEmailInForgotPassword(
      email: email,
      language: language,
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
            context, 'Check your email for password recovery code'.tr);
      } else if (response.statusCode == 500) {
        loadingAdminEnterEmailInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
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
    language,
  }) {
    loadingAdminEnterOTPInForgotPassword.value = true;
    loadingDialogBox(
        context!, RxBool(loadingAdminEnterOTPInForgotPassword.value));

    AuthApiServices.getAdminEnterOTPInForgotPassword(
      email: email,
      opt: otp,
      language: language,
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
            context, 'Something went wrong. Please try again.'.tr);
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
    language,
  }) {
    loadingAdminResetPasswordInForgotPassword.value = true;
    loadingDialogBox(
        context!, RxBool(loadingAdminResetPasswordInForgotPassword.value));

    AuthApiServices.getAdminResetPasswordInForgotPassword(
      email: email,
      newPassword: newPassword,
      language: language,
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

        customScaffoldMessenger(context, 'Password changed successfully'.tr);
      } else if (response.statusCode == 500) {
        loadingAdminResetPasswordInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingAdminResetPasswordInForgotPassword.value = false;
        Get.back();

        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
