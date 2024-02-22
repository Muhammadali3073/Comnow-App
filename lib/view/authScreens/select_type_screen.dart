import 'package:comnow/view/authScreens/adminAuthScreens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../widgets/widget_utils.dart';
import 'adminAuthScreens/login_screen.dart';
import 'teamMemberAuthScreens/login_with_qr_screen.dart';

//ignore: must_be_immutable
class SelectTypeScreen extends StatelessWidget {
  SelectTypeScreen({super.key, required this.alreadyHaveAccount});

  String alreadyHaveAccount;

  @override
  Widget build(BuildContext context) {
    var isSelected = true.obs;
    var selectedType = 'Admin'.obs;
    return Obx(
      () => Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(
              top: 4.h, left: 5.5.h, right: 5.5.h, bottom: 7.6.h),
          decoration: const BoxDecoration(
              gradient: Constants.authGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    child: getAssetPng('splash_logo.png'),
                  ),
                  customWhiteMediumText(
                    text: 'Select Your Account Type',
                    textAlign: TextAlign.center,
                    fontSize: 20.px,
                  ),
                ],
              ),
              Column(
                children: [
                  selectTypeCard(
                    'Admin',
                    imageUrl: 'select_admin.svg',
                    onTap: () {
                      isSelected.value = true;
                      selectedType.value = 'Admin';
                    },
                    backgroundColor:
                        isSelected.value ? CustomColors.blueButtonColor : CustomColors.whiteButtonColor,
                    textColor: isSelected.value
                        ? CustomColors.titleWhiteTextColor
                        : CustomColors.titleBlackTextColor,
                  ),
                  getVerSpace(3.2.h),
                  selectTypeCard(
                    'Team Member',
                    imageUrl: 'select_team_member.svg',
                    onTap: () {
                      isSelected.value = false;
                      selectedType.value = 'Team Member';
                    },
                    backgroundColor:
                        isSelected.value ? CustomColors.whiteButtonColor : CustomColors.blueButtonColor,
                    textColor: isSelected.value
                        ? CustomColors.titleBlackTextColor
                        : CustomColors.titleWhiteTextColor,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.h),
                child: gradientButton(
                  'Next',
                  onTap: () => selectedType.value == 'Admin'
                      ? alreadyHaveAccount == 'Existing User'
                          ? Get.to(() => const LoginScreen())
                          : Get.to(() => const SignUpScreen())
                      : Get.to(() => const LoginWithQRScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
