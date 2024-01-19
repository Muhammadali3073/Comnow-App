import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/profileControllers/profile_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';
import '../../widgets/widget_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ProfileController profileController = Get.find(tag: 'profileController');
  TextEditingController currentPasswordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  var currentToken = ''.obs;
  String? selectedLanguageCode;

  getTokenAndLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    currentToken.value = sharedPreferences.getString('token') ?? '';
    log(currentToken.toString());

    // Get App Language in SharedPreferences
    selectedLanguageCode =
        sharedPreferences.getString('selectedLanguageCode') ?? 'en';
    log('App Language: $selectedLanguageCode');
  }

  @override
  void initState() {
    getTokenAndLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Change Password',
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: CustomColors.whiteButtonColor,
              size: 2.h,
            )),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 5.6.h),
        decoration: const BoxDecoration(gradient: Constant.appGradient),
        child: Column(children: [
          addMemberTextField(
            controller: currentPasswordTextController,
            titleText: 'Current Password',
            hintText: 'Enter current password',
          ),
          getVerSpace(1.6.h),
          addMemberTextField(
            controller: newPasswordTextController,
            titleText: 'New Password',
            hintText: 'Enter new password',
          ),
          getVerSpace(1.6.h),
          addMemberTextField(
            controller: confirmPasswordTextController,
            titleText: 'Confirm Password',
            hintText: 'Enter confirm password',
          ),
          getVerSpace(5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: gradientButton(
              'Update',
              onTap: () {
                if (Validations.handleChangePasswordScreenError(
                  currentPasswordTextController: currentPasswordTextController,
                  newPasswordTextController: newPasswordTextController,
                  confirmPasswordTextController: confirmPasswordTextController,
                ).isNotEmpty) {
                  customScaffoldMessenger(
                      context,
                      Validations.handleChangePasswordScreenError(
                        currentPasswordTextController:
                            currentPasswordTextController,
                        newPasswordTextController: newPasswordTextController,
                        confirmPasswordTextController:
                            confirmPasswordTextController,
                      ));
                } else {
                  profileController.handleAdminChangePassword(
                    context,
                    token: currentToken.value,
                    language: selectedLanguageCode,
                    currentPassword: currentPasswordTextController.text,
                    newPassword: newPasswordTextController.text,
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
