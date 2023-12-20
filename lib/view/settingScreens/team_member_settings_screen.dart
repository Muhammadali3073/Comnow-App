
import 'package:comnow/view/authScreens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../widgets/widget_utils.dart';
import 'adminSettingsScreens/contact_support_screen.dart';
import 'adminSettingsScreens/language_screen.dart';

class TeamMemberSettingsScreen extends StatelessWidget {
  const TeamMemberSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Settings',
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          CustomColors.topBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.topBackgroundColor,
        ])),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 2.4.h, right: 2.4.h, left: 2.4.h, bottom: 2.4.h),
            child: Column(children: [
              Container(
                  width: 8.h,
                  height: 8.h,
                  alignment: Alignment.center,
                  decoration:
                      const BoxDecoration(color: CustomColors.greenColor, shape: BoxShape.circle),
                  child: customWhiteMediumText(
                    text: 'MOA',
                    fontSize: 18.sp,
                  )),
              getVerSpace(1.h),
              customWhiteMediumText(text: 'Mohsin Ali', fontSize: 16.sp),
              getVerSpace(5.h),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 1.h),
                decoration: BoxDecoration(
                  color: CustomColors.settingTitleBGColor,
                  borderRadius: BorderRadius.circular(4.px),
                ),
                child: customWhiteMediumText(
                    text: 'Language',
                    fontSize: 15.sp,
                    fontFamily: Constant.fontsFamilyRegular),
              ),
              InkWell(
                onTap: () => Get.to(() => const LanguageScreen()),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            getSvgImage(
                              'language_icon.svg',
                              height: 2.8.h,
                            ),
                            getHorSpace(1.h),
                            customWhiteMediumText(
                              text: 'Language',
                              fontSize: 15.sp,
                            ),
                          ],
                        ),
                        customWhiteMediumText(
                          text: 'English  ',
                          fontSize: 14.sp,
                          fontFamily: Constant.fontsFamilyRegular,
                          color: CustomColors.blueTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 1.h),
                decoration: BoxDecoration(
                  color: CustomColors.settingTitleBGColor,
                  borderRadius: BorderRadius.circular(4.px),
                ),
                child: customWhiteMediumText(
                    text: 'Others',
                    fontSize: 15.sp,
                    fontFamily: Constant.fontsFamilyRegular),
              ),
              InkWell(
                onTap: () => Get.to(() => const ContactSupportScreen()),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Row(
                      children: [
                        getSvgImage(
                          'support_icon.svg',
                          height: 2.8.h,
                        ),
                        getHorSpace(1.h),
                        customWhiteMediumText(
                          text: 'Contact Support',
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.5.h),
                    child: Row(
                      children: [
                        getSvgImage(
                          'share_icon.svg',
                          height: 2.8.h,
                        ),
                        getHorSpace(1.h),
                        customWhiteMediumText(
                          text: 'Share App',
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => logoutDialogBox(
                  context,
                  onTap: () => Get.offAll(() => const WelcomeScreen()),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      getSvgImage(
                        'logout_icon_setting.svg',
                        height: 2.8.h,
                      ),
                      getHorSpace(1.h),
                      customWhiteMediumText(
                        text: 'Logout',
                        fontSize: 15.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
