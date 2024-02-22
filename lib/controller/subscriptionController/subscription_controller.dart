import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../utils/constant.dart';
import '../../view/navBarScreen/admin_nav_bar_screen.dart';
import '../../view/widgets/widget_utils.dart';

class SubscriptionController extends GetxController {
  var loadingSubscription = false.obs;

  setSubscription(isSubscription) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isSubscription', isSubscription);
  }

  // Subscription
  handleSubscription(
    BuildContext? context, {
    token,
    isSubscribed,
    code,
    expiry,
    language,
  }) {
    loadingSubscription.value = true;
    loadingDialogBox(context!, RxBool(loadingSubscription.value));

    SubscriptionApiServices.getSubscription(
      token: token,
      isSubscribed: isSubscribed,
      code: code,
      expiry: expiry,
      language: language,
    ).then((response) {
      var jsonData = jsonDecode(response.body);
      if (response == null) {
        timeOutException(loading: loadingSubscription);
      } else if (response.statusCode == 200) {
        loadingSubscription.value = false;
        Get.back();

        setSubscription(jsonData['success']);

        if (jsonData['success'] == true) {
          Constants.getRequiredDataForApis();
          // Go to next screen
          Get.offAll(() => const AdminBottomNavigationBarScreen());

          customScaffoldMessenger(context, 'Subscribed Success'.tr);
        }
      } else if (response.statusCode == 500) {
        loadingSubscription.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else {
        loadingSubscription.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }
}
