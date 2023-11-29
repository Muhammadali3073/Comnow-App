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
    return Obx(
      () => Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(
              top: 4.h, left: 9.5.h, right: 9.5.h, bottom: 17.1.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [topBackgroundColor, bottomBackgroundColor])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  getAssetPng('splash_logo.png'),
                  customWhiteMediumText(
                    text: 'Welcome to Comnow',
                    fontSize: 20.px,
                  ),
                ],
              ),
              Column(
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
                    },
                    backgroundColor:
                        isSelected.value ? blueButtonColor : whiteButtonColor,
                    textColor: isSelected.value
                        ? titleWhiteTextColor
                        : titleBlackTextColor,
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
                    },
                    backgroundColor:
                        isSelected.value ? whiteButtonColor : blueButtonColor,
                    textColor: isSelected.value
                        ? titleBlackTextColor
                        : titleWhiteTextColor,
                  ),
                ],
              ),
              gradientButton(
                'Next',
                onTap: () => Get.to(const SelectTypeScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
