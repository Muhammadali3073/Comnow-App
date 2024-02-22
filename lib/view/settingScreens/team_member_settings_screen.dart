import 'package:comnow/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../controller/profileControllers/member_profile_controller.dart';
import '../widgets/widget_utils.dart';
import 'adminSettingsScreens/contact_support_screen.dart';
import 'adminSettingsScreens/language_screen.dart';

class TeamMemberSettingsScreen extends StatefulWidget {
  const TeamMemberSettingsScreen({super.key});

  @override
  State<TeamMemberSettingsScreen> createState() =>
      _TeamMemberSettingsScreenState();
}

class _TeamMemberSettingsScreenState extends State<TeamMemberSettingsScreen> {
  MemberProfileController memberProfileController =
      Get.find(tag: 'memberProfileController');

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
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 2.4.h, right: 2.4.h, left: 2.4.h, bottom: 2.4.h),
            child: Obx(
              () => Column(children: [
                memberProfileController.loadingGetMemberProfile.value ||
                        memberProfileController.getMemberData.value == null
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
                                    text: '***** *****', fontSize: 16.sp),
                              ],
                            )))
                    : Column(
                        children: [
                          CircleAvatar(
                            radius: 5.h,
                            backgroundColor: memberProfileController
                                        .getMemberData
                                        .value!
                                        .data!
                                        .user!
                                        .color ==
                                    null
                                ? CustomColors.hintColor
                                : memberProfileController
                                    .getMemberData.value!.data!.user!.color!
                                    .toColor(),
                            child: customWhiteMediumText(
                              text: memberProfileController
                                  .getMemberData.value!.data!.user!.initials
                                  .toString()
                                  .toUpperCase(),
                              fontSize: 18.sp,
                            ),
                          ),
                          getVerSpace(1.h),
                          customWhiteMediumText(
                              text: memberProfileController
                                  .getMemberData.value!.data!.user!.fullName
                                  .toString(),
                              fontSize: 16.sp),
                        ],
                      ),
                getVerSpace(5.h),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 1.h),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 1.h),
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
                    onTap: () {
                      Get.back();
                      memberProfileController.handleMemberLogout(
                        context,
                        userName: memberProfileController
                            .getMemberData.value!.data!.user!.fullName
                            .toString(),
                        token: Constants.tokenOfMember.value,
                        language: Constants.codeOfLanguage.value,
                      );
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
