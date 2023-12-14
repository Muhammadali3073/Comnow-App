import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';
import '../services/time_out_method.dart';


class AuthController extends GetxController {
  var loadingRegistration = false.obs;

  // register
  handleRegister(
      {name,
      password,
      email,
      confirmPassword,
      contactNo,
      dOB,
      gender,
      cityKey,
      BuildContext? context}) async {
    loadingRegistration.value = true;

    AuthApiServices.getRegistration(
            email: email,
            password: password,
            passwordConfirmation: confirmPassword,
            name: name,
            contactNo: contactNo,
            cityKey: cityKey)
        .then((value) async {
      var jsonData = jsonDecode(value.body);

      if (value == null) {
        timeOutException(loading: loadingRegistration);
      } else if (value.statusCode == 200) {
        // Get.offAll(AuthScreen(isShowB: RxBool(true)));
        loadingRegistration.value = false;
      } else if (value.statusCode == 500) {
        loadingRegistration.value = false;

        Get.defaultDialog(
          title: 'Something Went Wrong',
          content: Text('${jsonData['message']}: Error Code: 500'),
        );
      }
    });
  }
}
