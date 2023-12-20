import 'package:comnow/view/authScreens/select_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../widgets/widget_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isSelected = true.obs;
    var alreadyHaveAccount = 'Existing User'.obs;
    return Obx(
      () => Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(
              top: 4.h, left: 9.5.h, right: 9.5.h, bottom: 17.1.h),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [CustomColors.topBackgroundColor, CustomColors.bottomBackgroundColor])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: getAssetPng('splash_logo.png'),
                  ),
                  customWhiteMediumText(
                    text: 'Welcome to Comnow',
                    textAlign: TextAlign.center,
                    fontSize: 20.px,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customWhiteMediumText(
                      text: 'Are you ?',
                      fontSize: 18.px,
                    ),
                    getVerSpace(4.h),
                    authButton(
                      'Existing User',
                      onTap: () {
                        isSelected.value = true;
                        alreadyHaveAccount.value = 'Existing User';
                      },
                      backgroundColor:
                          isSelected.value ? CustomColors.blueButtonColor : CustomColors.whiteButtonColor,
                      textColor: isSelected.value
                          ? CustomColors.titleWhiteTextColor
                          : CustomColors.titleBlackTextColor,
                    ),
                    getVerSpace(1.2.h),
                    customWhiteMediumText(
                      text: 'or',
                      fontSize: 12.px,
                    ),
                    getVerSpace(1.2.h),
                    authButton(
                      'New User',
                      onTap: () {
                        isSelected.value = false;
                        alreadyHaveAccount.value = 'New User';
                      },
                      backgroundColor:
                          isSelected.value ? CustomColors.whiteButtonColor : CustomColors.blueButtonColor,
                      textColor: isSelected.value
                          ? CustomColors.titleBlackTextColor
                          : CustomColors.titleWhiteTextColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.5.h),
                child: gradientButton(
                  'Next',
                  onTap: () => Get.to(() => SelectTypeScreen(
                        alreadyHaveAccount: alreadyHaveAccount.value,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
