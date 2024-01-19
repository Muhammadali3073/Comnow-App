import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/authModels/admin_profile_model.dart';
import '../../model/templateMessageModel/template_message_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../utils/color_data.dart';
import '../../view/widgets/widget_utils.dart';

class ProfileController extends GetxController {
  var loadingGetAdminProfile = false.obs;
  var loadingAdminChangePassword = false.obs;
  var loadingAdminAddNewMessage = false.obs;
  var loadingGetAdminAddNewMessage = false.obs;
  Rxn<AdminProfileModel> getAdminProfile = Rxn<AdminProfileModel>();
  Rxn<TemplateOfMessageModel> getTemplateOfMessageModel =
      Rxn<TemplateOfMessageModel>();

  // Get Admin Profile
  handleGetAdminProfile(
    BuildContext? context, {
    token,
  }) async {
    loadingGetAdminProfile.value = true;

    ProfileApiServices.getAdminProfile(
      token: token,
    ).then((response) async {
      if (response == null) {
        timeOutException(loading: loadingGetAdminProfile);
      } else if (response.statusCode == 200) {
        loadingGetAdminProfile.value = false;

        getAdminProfile.value = adminProfileModelFromJson(response.body);

        log(getAdminProfile.value!.message.toString());
      } else if (response.statusCode == 500) {
        loadingGetAdminProfile.value = false;

        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingGetAdminProfile.value = false;
        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      }
    });
  }

  // Admin Change Password
  handleAdminChangePassword(
    BuildContext? context, {
    token,
    currentPassword,
    newPassword,
    language,
  }) async {
    loadingAdminChangePassword.value = true;
    loadingDialogBox(context!, RxBool(loadingAdminChangePassword.value));

    ProfileApiServices.adminChangePassword(
      token: token,
      currentPassword: currentPassword,
      newPassword: newPassword,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingAdminChangePassword);
      } else if (response.statusCode == 200) {
        loadingAdminChangePassword.value = false;
        Get.back();

        // Call group Data
        handleGetAdminProfile(context, token: token);

        // Go to next screen
        Get.back();

        Fluttertoast.showToast(
            msg: "Update password successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingAdminChangePassword.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingAdminChangePassword.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Get Admin Add New Message
  handleGetAdminAddNewMessage(
    BuildContext? context, {
    token,
  }) async {
    loadingGetAdminAddNewMessage.value = true;

    ProfileApiServices.getAdminAddNewMessage(
      token: token,
    ).then((response) async {
      if (response == null) {
        timeOutException(loading: loadingGetAdminAddNewMessage);
      } else if (response.statusCode == 200) {
        loadingGetAdminAddNewMessage.value = false;

        getTemplateOfMessageModel.value =
            templateOfMessageModelFromJson(response.body);

        log(getTemplateOfMessageModel.value!.message.toString());
      } else if (response.statusCode == 500) {
        loadingGetAdminAddNewMessage.value = false;

        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingGetAdminAddNewMessage.value = false;
        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      }
    });
  }

  // Admin Add New Message
  handleAdminAddNewMessage(
    BuildContext? context, {
    token,
    textOfMessage,
    language,
  }) async {
    loadingAdminAddNewMessage.value = true;
    loadingDialogBox(context!, RxBool(loadingAdminAddNewMessage.value));

    ProfileApiServices.adminAddNewMessage(
      token: token,
      textOfMessage: textOfMessage,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingAdminAddNewMessage);
      } else if (response.statusCode == 200) {
        loadingAdminAddNewMessage.value = false;
        Get.back();

        // Call group Data
        handleGetAdminAddNewMessage(context, token: token);

        // Go to next screen
        Get.back();

        Fluttertoast.showToast(
            msg: "Add new template successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingAdminAddNewMessage.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingAdminAddNewMessage.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
