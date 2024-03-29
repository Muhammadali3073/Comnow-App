import 'dart:developer';

import 'package:comnow/utils/extensions.dart';
import 'package:comnow/view/authScreens/welcome_screen.dart';
import 'package:comnow/view/settingScreens/adminSettingsScreens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/profileControllers/profile_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../widgets/widget_utils.dart';
import 'allMessagesScreen/all_messages_screen.dart';
import 'change_password_screen.dart';
import 'contact_support_screen.dart';
import 'edit_your_name_screen.dart';
import 'language_screen.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  State<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {
  ProfileController profileController = Get.find(tag: 'profileController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Settings',
            fontFamily: Constants.fontsFamilyBold,
            fontSize: 16.sp),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 2.4.h, right: 2.4.h, left: 2.4.h, bottom: 2.4.h),
            child: Obx(() => Column(
                  children: [
                    profileController.loadingGetAdminProfile.value ||
                            profileController.getAdminProfile.value == null
                        ? SizedBox(
                            child: Shimmer.fromColors(
                                baseColor: CustomColors.bottomBackgroundColor,
                                highlightColor: Colors.black12,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 5.h,
                                    ),
                                    getVerSpace(1.h),
                                    customWhiteMediumText(
                                        text: '********', fontSize: 16.sp),
                                    customWhiteMediumText(
                                        text: '**************',
                                        fontSize: 14.sp,
                                        fontFamily: Constants.fontsFamilyRegular,
                                        color: CustomColors.voiceNoteColor),
                                    getVerSpace(1.h),
                                    Container(
                                      width: 7.h,
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.6.h),
                                      decoration: BoxDecoration(
                                          color: CustomColors.blueButtonColor,
                                          borderRadius:
                                              BorderRadius.circular(8.px)),
                                      child: customWhiteMediumText(
                                          text: '',
                                          fontSize: 14.sp,
                                          fontFamily:
                                              Constants.fontsFamilyRegular),
                                    ),
                                  ],
                                )))
                        : Column(
                            children: [
                              CircleAvatar(
                                radius: 5.h,
                                backgroundColor: profileController
                                            .getAdminProfile
                                            .value!
                                            .data!
                                            .user!
                                            .color ==
                                        null
                                    ? CustomColors.hintColor
                                    : profileController.getAdminProfile.value!
                                        .data!.user!.color!
                                        .toColor(),
                                child: customWhiteMediumText(
                                  text: profileController.getAdminProfile.value!
                                      .data!.user!.initials
                                      .toString()
                                      .toUpperCase(),
                                  fontSize: 18.sp,
                                ),
                              ),
                              getVerSpace(1.h),
                              customWhiteMediumText(
                                  text: profileController.getAdminProfile.value!
                                      .data!.user!.fullName
                                      .toString(),
                                  fontSize: 16.sp),
                              customWhiteMediumText(
                                  text: profileController
                                      .getAdminProfile.value!.data!.user!.email
                                      .toString(),
                                  fontSize: 14.sp,
                                  fontFamily: Constants.fontsFamilyRegular,
                                  color: CustomColors.voiceNoteColor),
                              getVerSpace(1.h),
                              GestureDetector(
                                onTap: () => Get.to(() => EditYourNameScreen(
                                      fullName: profileController
                                          .getAdminProfile
                                          .value!
                                          .data!
                                          .user!
                                          .fullName
                                          .toString(),
                                      initialColor: profileController
                                              .getAdminProfile
                                              .value!
                                              .data!
                                              .user!
                                              .color ??
                                          '#C1C1C1',
                                      initials: profileController
                                          .getAdminProfile
                                          .value!
                                          .data!
                                          .user!
                                          .initials
                                          .toString(),
                                    )),
                                child: Container(
                                  width: 7.h,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.6.h),
                                  decoration: BoxDecoration(
                                      color: CustomColors.blueButtonColor,
                                      borderRadius:
                                          BorderRadius.circular(8.px)),
                                  child: customWhiteMediumText(
                                      text: 'Edit',
                                      fontSize: 14.sp,
                                      fontFamily: Constants.fontsFamilyRegular),
                                ),
                              ),
                            ],
                          ),
                    getVerSpace(2.4.h),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.8.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                        color: CustomColors.settingTitleBGColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child: customWhiteMediumText(
                          text: 'Message Template',
                          fontSize: 15.sp,
                          fontFamily: Constants.fontsFamilyRegular),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const AllMessagesScreen()),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Row(
                            children: [
                              getSvgImage(
                                'all_message_icon.svg',
                                height: 2.8.h,
                              ),
                              getHorSpace(1.h),
                              customWhiteMediumText(
                                text: 'All Messages',
                                fontSize: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.8.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                        color: CustomColors.settingTitleBGColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child: customWhiteMediumText(
                          text: 'Password',
                          fontSize: 15.sp,
                          fontFamily: Constants.fontsFamilyRegular),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const ChangePasswordScreen()),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Row(
                            children: [
                              getSvgImage(
                                'password_icon_setting.svg',
                                height: 2.8.h,
                              ),
                              getHorSpace(1.h),
                              customWhiteMediumText(
                                text: 'Change Password',
                                fontSize: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.8.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                        color: CustomColors.settingTitleBGColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child: customWhiteMediumText(
                          text: 'Payments',
                          fontSize: 15.sp,
                          fontFamily: Constants.fontsFamilyRegular),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const SubscriptionScreen()),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Row(
                            children: [
                              getSvgImage(
                                'subscription_icon.svg',
                                height: 2.8.h,
                              ),
                              getHorSpace(1.h),
                              customWhiteMediumText(
                                text: 'Subscription',
                                fontSize: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.5.h),
                      child: Row(
                        children: [
                          getSvgImage(
                            'restore_icon.svg',
                            height: 2.8.h,
                          ),
                          getHorSpace(1.h),
                          customWhiteMediumText(
                            text: 'Restore Purchases',
                            fontSize: 15.sp,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.8.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                        color: CustomColors.settingTitleBGColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child: customWhiteMediumText(
                          text: 'Language',
                          fontSize: 15.sp,
                          fontFamily: Constants.fontsFamilyRegular),
                    ),
                    InkWell(
                      onTap: () => Get.to(
                        () => const LanguageScreen(),
                      ),
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
                              Obx(
                                () => customWhiteMediumText(
                                  text: Constants.selectedLanguage.value
                                      .toString()
                                      .tr,
                                  fontSize: 14.sp,
                                  fontFamily: Constants.fontsFamilyRegular,
                                  color: CustomColors.blueTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.8.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                        color: CustomColors.settingTitleBGColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child: customWhiteMediumText(
                          text: 'Others',
                          fontSize: 15.sp,
                          fontFamily: Constants.fontsFamilyRegular),
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
                        onTap: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          // Remove Token and IsLogin in SharedPreferences
                          sharedPreferences.clear();

                          log('User Login Status: ${sharedPreferences.getBool('isAdminLogin')}');
                          log('User Login Token: ${sharedPreferences.getString('token')}');
                          log('User Login defaultTeamId: ${sharedPreferences.getString('defaultTeamId')}');

                          Get.offAll(() => const WelcomeScreen());
                        },
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
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
