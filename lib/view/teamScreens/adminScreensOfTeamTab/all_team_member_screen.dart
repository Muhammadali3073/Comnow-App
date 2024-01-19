import 'dart:developer';

import 'package:comnow/utils/extensions.dart';
import 'package:comnow/view/popUpMenuScreens/adminSidePopUpMenuScreens/message_templates_screen.dart';
import 'package:comnow/view/popUpMenuScreens/adminSidePopUpMenuScreens/voice_message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/groupController/get_groups_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../widgets/widget_utils.dart';

//ignore: must_be_immutable
class AllTeamMemberScreen extends StatefulWidget {
  const AllTeamMemberScreen({super.key});

  @override
  State<AllTeamMemberScreen> createState() => _AllTeamMemberScreenState();
}

class _AllTeamMemberScreenState extends State<AllTeamMemberScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  GetGroupsController getGroupsController =
      Get.find(tag: 'getGroupsController');

  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController initialsTextController = TextEditingController();

  Rx<Color> initialColor = CustomColors.topButtonColor.obs;
  var initialColorCode = ''.obs;
  var initialsString = ''.obs;
  var currentToken = ''.obs;
  String? selectedLanguageCode;

  DataFile dataFile = DataFile();

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
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Obx(
      () => getGroupsController.loadingAddMemberInTeam.value ||
              getGroupsController.allMembersData.value == null
          ? SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Shimmer.fromColors(
                  baseColor: CustomColors.bottomBackgroundColor,
                  highlightColor: Colors.black12,
                  child: Column(
                    children: [
                      Container(
                        color: CustomColors.tabBarColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.4.h, vertical: 0.9.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customWhiteMediumText(
                                text: '',
                                fontSize: 14.sp,
                                fontFamily: Constant.fontsFamilyRegular,
                              ),
                              customWhiteMediumText(
                                text: '',
                                fontSize: 14.sp,
                                fontFamily: Constant.fontsFamilyRegular,
                              ),
                            ]),
                      ),
                      Container(
                        height: 3.8.h,
                        margin: EdgeInsets.symmetric(
                          horizontal: 2.4.h,
                          vertical: 2.4.h,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColors.textFormFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 6.h,
                              margin: EdgeInsets.only(
                                  right: 2.4.h, left: 2.4.h, top: 1.h),
                              decoration: BoxDecoration(
                                color:
                                    CustomColors.textFormFieldBackgroundColor,
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            )
          : Column(
              children: [
                Container(
                  color: CustomColors.tabBarColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 0.9.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customWhiteMediumText(
                          text: 'My Team',
                          fontSize: 14.sp,
                          fontFamily: Constant.fontsFamilyRegular,
                        ),
                        customWhiteMediumText(
                          text:
                              'Total Member(${getGroupsController.allMembersData.value!.data!.teamMembers!.length})',
                          fontSize: 14.sp,
                          fontFamily: Constant.fontsFamilyRegular,
                        ),
                      ]),
                ),
                Container(
                  height: 3.8.h,
                  margin:
                      EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 2.4.h),
                  decoration: BoxDecoration(
                    color: CustomColors.textFormFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: Theme(
                    data: theme.copyWith(
                      colorScheme: theme.colorScheme.copyWith(
                        surfaceVariant: Colors.transparent,
                      ),
                    ),
                    child: TabBar(
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: CustomColors.activeTabBarColor,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      labelColor: CustomColors.titleBlackTextColor,
                      unselectedLabelColor: CustomColors.titleWhiteTextColor,
                      tabs: [
                        Tab(
                          text:
                              'All (${getGroupsController.allMembersData.value!.data!.teamMembers!.length})',
                        ),
                        Tab(
                          text:
                              'Blocked (${getGroupsController.allMembersData.value!.data!.teamMembers!.where((element) => element.blocked == true).length})',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // first inner tab bar view widget
                      getGroupsController.loadingGetMembersInTeam.value
                          ? SizedBox(
                              child: Shimmer.fromColors(
                                  baseColor: CustomColors.bottomBackgroundColor,
                                  highlightColor: Colors.black12,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: getGroupsController
                                                .allMembersData
                                                .value!
                                                .data!
                                                .teamMembers ==
                                            null
                                        ? 1
                                        : getGroupsController.allMembersData
                                            .value!.data!.teamMembers!
                                            .where((element) =>
                                                element.blocked == false)
                                            .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 6.h,
                                        margin: EdgeInsets.only(
                                            right: 2.4.h,
                                            left: 2.4.h,
                                            top: 1.h),
                                        decoration: BoxDecoration(
                                          color: CustomColors
                                              .textFormFieldBackgroundColor,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            )
                          : Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.transparent,
                              ),
                              child: ReorderableListView(
                                onReorder: (oldIndex, newIndex) {
                                  setState(() {
                                    final newIdx = newIndex > oldIndex
                                        ? newIndex - 1
                                        : newIndex;
                                    final item = getGroupsController
                                        .allMembersData
                                        .value!
                                        .data!
                                        .teamMembers!
                                        .removeAt(oldIndex);
                                    getGroupsController.allMembersData.value!
                                        .data!.teamMembers!
                                        .insert(newIdx, item);
                                  });
                                },
                                shrinkWrap: true,
                                children: [
                                  for (final item in getGroupsController
                                      .allMembersData.value!.data!.teamMembers!
                                      .where((element) =>
                                          element.blocked == false))
                                    Container(
                                        key: Key(item.id.toString()),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.4.h),
                                        // Show Cards in List
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.5.h, vertical: 1.h),
                                          margin:
                                              EdgeInsets.only(bottom: 1.4.h),
                                          decoration: BoxDecoration(
                                            color: item.leavedTeam == true &&
                                                    item.blocked == false
                                                ? CustomColors
                                                    .leftMemberBGCardColor
                                                : CustomColors
                                                    .textFormFieldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 2.5.h,
                                                      backgroundColor: item
                                                                      .leavedTeam ==
                                                                  true &&
                                                              item.blocked ==
                                                                  false
                                                          ? CustomColors
                                                              .leftMemberBGColor
                                                          : item.color == null
                                                              ? CustomColors
                                                                  .blueColor
                                                              : item.color!
                                                                  .toColor(),
                                                      child:
                                                          customWhiteMediumText(
                                                              text:
                                                                  item.initials ??
                                                                      '',
                                                              fontSize: 14.sp),
                                                    ),
                                                    getHorSpace(1.h),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        customWhiteMediumText(
                                                          text: item.fullName,
                                                          fontSize: 15.sp,
                                                          fontFamily: Constant
                                                              .fontsFamilyRegular,
                                                        ),
                                                        getVerSpace(0.4.h),
                                                        item.blocked == true
                                                            ? const SizedBox
                                                                .shrink()
                                                            : customWhiteMediumText(
                                                                text: item.isOnline ==
                                                                        true
                                                                    ? 'Online'
                                                                    : 'Offline',
                                                                color: item.isOnline ==
                                                                        true
                                                                    ? CustomColors
                                                                        .greenColor
                                                                    : item.isOnline ==
                                                                            false
                                                                        ? CustomColors
                                                                            .redColor
                                                                        // : listOfMembers.type ==
                                                                        //         'Away'
                                                                        //     ? CustomColors
                                                                        //         .yellowColor
                                                                        : CustomColors
                                                                            .titleBlackTextColor,
                                                                fontSize: 13.sp,
                                                                fontFamily: Constant
                                                                    .fontsFamilyRegular,
                                                              ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    item.blocked == true
                                                        ? const SizedBox
                                                            .shrink()
                                                        : CircleAvatar(
                                                            radius: 0.5.h,
                                                            backgroundColor: item
                                                                        .isOnline ==
                                                                    true
                                                                ? CustomColors
                                                                    .greenColor
                                                                : item.isOnline ==
                                                                        false
                                                                    ? CustomColors
                                                                        .redColor
                                                                    //         : listOfMembers
                                                                    //                     .type ==
                                                                    //                 'Away'
                                                                    //             ? CustomColors
                                                                    //                 .yellowColor
                                                                    : item.leavedTeam ==
                                                                                false ||
                                                                            item.leavedGroup ==
                                                                                false
                                                                        ? Colors
                                                                            .transparent
                                                                        : Colors
                                                                            .transparent,
                                                          ),
                                                    getHorSpace(1.5.h),
                                                    GestureDetector(
                                                      onTap: () => item
                                                                  .leavedTeam ==
                                                              true
                                                          ? leftMemberDialogBox(
                                                              context,
                                                              item.fullName,
                                                              onRemoveTap: () {
                                                                Get.back();
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        "${item.fullName} is removed successfully",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity: ToastGravity
                                                                        .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        CustomColors
                                                                            .toastColor,
                                                                    textColor:
                                                                        CustomColors
                                                                            .titleWhiteTextColor,
                                                                    fontSize:
                                                                        14.sp);
                                                              },
                                                              onScanTap: () {
                                                                Get.back();
                                                                // Get.to(() =>
                                                                //     const ShareQRCodeScreen());
                                                              },
                                                            )
                                                          : memberCardBottomSheet(
                                                              context,
                                                              pingOnTap: () {
                                                                Get.back();
                                                              },
                                                              textMessageOnTap:
                                                                  () {
                                                                Get.back();
                                                                Get.to(() =>
                                                                    const MessageTemplatesScreen());
                                                              },
                                                              voiceMessageOnTap:
                                                                  () {
                                                                Get.back();
                                                                Get.to(() =>
                                                                    const VoiceMessageScreen());
                                                              },
                                                              blockOnTap: () {
                                                                Get.back();

                                                                blockDialogBox(
                                                                  context,
                                                                  userName: item
                                                                      .fullName,
                                                                  onCreate: () {
                                                                    Get.back();

                                                                    getGroupsController
                                                                        .handleEditMemberStatus(
                                                                      context,
                                                                      language:
                                                                          selectedLanguageCode,
                                                                      userName:
                                                                          item.fullName,
                                                                      groupId:
                                                                          'null',
                                                                      teamMemberId:
                                                                          item.id,
                                                                      token: currentToken
                                                                          .value,
                                                                      blockedStatus:
                                                                          'blocked',
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              deleteOnTap: () {
                                                                Get.back();
                                                                deleteGroupDialogBox(
                                                                  context,
                                                                  groupName: item
                                                                      .fullName,
                                                                  onCreate: () {
                                                                    Get.back();
                                                                    getGroupsController
                                                                        .handleDeleteMember(
                                                                      context,
                                                                      groupId:
                                                                          'null',
                                                                      userName:
                                                                          item.fullName,
                                                                      teamMemberId:
                                                                          item.id,
                                                                      token: currentToken
                                                                          .value,
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              editOnTap: () {
                                                                initialColor
                                                                        .value =
                                                                    item.color!
                                                                        .toColor();
                                                                initialsString
                                                                        .value =
                                                                    item.initials!;

                                                                var splitIndex =
                                                                    item.fullName!
                                                                        .indexOf(
                                                                            ' ');

                                                                firstNameTextController
                                                                        .text =
                                                                    item.fullName!
                                                                        .substring(
                                                                            0,
                                                                            splitIndex)
                                                                        .trim();
                                                                lastNameTextController
                                                                        .text =
                                                                    item.fullName!
                                                                        .substring(
                                                                            splitIndex +
                                                                                1)
                                                                        .trim();
                                                                initialsTextController
                                                                        .text =
                                                                    item.initials!;

                                                                Get.back();

                                                                showDialog<
                                                                    void>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        surfaceTintColor:
                                                                            Colors
                                                                                .transparent,
                                                                        backgroundColor:
                                                                            CustomColors
                                                                                .dialogBoxColor,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(16
                                                                                .px)),
                                                                        title:
                                                                            Obx(
                                                                          () =>
                                                                              CircleAvatar(
                                                                            radius:
                                                                                5.h,
                                                                            backgroundColor:
                                                                                initialColor.value,
                                                                            child:
                                                                                customWhiteMediumText(text: initialsString.value.toString().toUpperCase(), fontSize: 18.sp),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child: SizedBox(
                                                                              child: Padding(
                                                                            padding: EdgeInsets.only(
                                                                                left: 1.6.h,
                                                                                right: 1.6.h,
                                                                                bottom: 2.6.h),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    addMemberTextField(
                                                                                      controller: firstNameTextController,
                                                                                      titleText: 'First name',
                                                                                      hintText: 'Enter first name',
                                                                                    ),
                                                                                    getVerSpace(1.6.h),
                                                                                    addMemberTextField(
                                                                                      controller: lastNameTextController,
                                                                                      titleText: 'Last name',
                                                                                      hintText: 'Enter last name',
                                                                                    ),
                                                                                    getVerSpace(1.6.h),
                                                                                    addMemberTextField(controller: initialsTextController, titleText: 'Initials', hintText: 'Enter Initials', onChanged: (value) => initialsString.value = value, inputFormatters: [
                                                                                      LengthLimitingTextInputFormatter(3),
                                                                                    ]),
                                                                                    getVerSpace(2.4.h),
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        customWhiteMediumText(
                                                                                          text: 'Select color',
                                                                                          fontFamily: Constant.fontsFamilyRegular,
                                                                                          fontSize: 14.sp,
                                                                                        ),
                                                                                        getVerSpace(0.7.h),
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#EA2A2A'.toColor();
                                                                                                initialColorCode.value = '#EA2A2A';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#EA2A2A'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#E4951F'.toColor();
                                                                                                initialColorCode.value = '#E4951F';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#E4951F'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#E4DC1F'.toColor();
                                                                                                initialColorCode.value = '#E4DC1F';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#E4DC1F'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#46E41F'.toColor();
                                                                                                initialColorCode.value = '#46E41F';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#46E41F'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#1FE4C1'.toColor();
                                                                                                initialColorCode.value = '#1FE4C1';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#1FE4C1'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#218FF5'.toColor();
                                                                                                initialColorCode.value = '#218FF5';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#218FF5'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#2F1FE4'.toColor();
                                                                                                initialColorCode.value = '#2F1FE4';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#2F1FE4'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#C81FE4'.toColor();
                                                                                                initialColorCode.value = '#C81FE4';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#C81FE4'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              borderRadius: BorderRadius.circular(
                                                                                                1.5.h,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                initialColor.value = '#E41FA1'.toColor();
                                                                                                initialColorCode.value = '#E41FA1';
                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                radius: 1.5.h,
                                                                                                backgroundColor: '#E41FA1'.toColor(),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                getVerSpace(3.h),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                        child: outlineButton(
                                                                                      'Cancel',
                                                                                      onTap: () => Get.back(),
                                                                                    )),
                                                                                    getHorSpace(2.h),
                                                                                    Expanded(
                                                                                        child: filledBlackButton(
                                                                                      'Save',
                                                                                      onTap: () {
                                                                                        Get.back();
                                                                                        getGroupsController.handleEditMemberProfile(
                                                                                          context,
                                                                                          groupId: 'null',
                                                                                          userName: '${firstNameTextController.text.trim()} ${lastNameTextController.text.trim()}',
                                                                                          teamMemberId: item.id,
                                                                                          initialsColor: initialColorCode.value,
                                                                                          initials: initialsTextController.text,
                                                                                          fullName: '${firstNameTextController.text} ${lastNameTextController.text}',
                                                                                          language: selectedLanguageCode,
                                                                                          token: currentToken.value,
                                                                                        );
                                                                                      },
                                                                                    )),
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )),
                                                                        ));
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: CustomColors
                                                                    .activeTabBarColor)),
                                                        child: Icon(
                                                          Icons
                                                              .more_horiz_outlined,
                                                          size: 2.3.h,
                                                          color: CustomColors
                                                              .activeTabBarColor,
                                                        ),
                                                      ),
                                                    ),
                                                    getHorSpace(0.5.h),
                                                  ],
                                                )
                                              ]),
                                        ))
                                ],
                              ),
                            ),

                      // second inner tab bar view widget
                      getGroupsController.loadingGetMembersInTeam.value
                          ? SizedBox(
                              child: Shimmer.fromColors(
                                  baseColor: CustomColors.bottomBackgroundColor,
                                  highlightColor: Colors.black12,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: getGroupsController
                                                .allMembersData
                                                .value!
                                                .data!
                                                .teamMembers ==
                                            null
                                        ? 1
                                        : getGroupsController.allMembersData
                                            .value!.data!.teamMembers!
                                            .where((element) =>
                                                element.blocked == true)
                                            .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 6.h,
                                        margin: EdgeInsets.only(
                                            right: 2.4.h,
                                            left: 2.4.h,
                                            top: 1.h),
                                        decoration: BoxDecoration(
                                          color: CustomColors
                                              .textFormFieldBackgroundColor,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            )
                          : Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.transparent,
                              ),
                              child: ReorderableListView(
                                onReorder: (oldIndex, newIndex) {
                                  setState(() {
                                    final newIdx = newIndex > oldIndex
                                        ? newIndex - 1
                                        : newIndex;
                                    final item = getGroupsController
                                        .allMembersData
                                        .value!
                                        .data!
                                        .teamMembers!
                                        .removeAt(oldIndex);
                                    getGroupsController.allMembersData.value!
                                        .data!.teamMembers!
                                        .insert(newIdx, item);
                                  });
                                },
                                shrinkWrap: true,
                                children: [
                                  for (final item in getGroupsController
                                      .allMembersData.value!.data!.teamMembers!
                                      .where(
                                          (element) => element.blocked == true))
                                    Container(
                                        key: Key(item.id.toString()),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.4.h),
                                        // Show Cards in List
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.5.h, vertical: 1.h),
                                          margin:
                                              EdgeInsets.only(bottom: 1.4.h),
                                          decoration: BoxDecoration(
                                            color: item.leavedTeam == true &&
                                                    item.blocked == false
                                                ? CustomColors
                                                    .leftMemberBGCardColor
                                                : CustomColors
                                                    .textFormFieldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 2.5.h,
                                                      backgroundColor: item
                                                                      .leavedTeam ==
                                                                  true &&
                                                              item.blocked ==
                                                                  false
                                                          ? CustomColors
                                                              .leftMemberBGColor
                                                          : item.color == null
                                                              ? CustomColors
                                                                  .blueColor
                                                              : item.color!
                                                                  .toColor(),
                                                      child:
                                                          customWhiteMediumText(
                                                              text:
                                                                  item.initials ??
                                                                      '',
                                                              fontSize: 14.sp),
                                                    ),
                                                    getHorSpace(1.h),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        customWhiteMediumText(
                                                          text: item.fullName,
                                                          fontSize: 15.sp,
                                                          fontFamily: Constant
                                                              .fontsFamilyRegular,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () =>
                                                      unblockedDialogBox(
                                                    context,
                                                    item.fullName,
                                                    onUnblock: () {
                                                      Get.back();
                                                      getGroupsController
                                                          .handleEditMemberStatus(
                                                        context,
                                                        language:
                                                            selectedLanguageCode,
                                                        userName: item.fullName,
                                                        groupId: 'null',
                                                        teamMemberId: item.id,
                                                        token:
                                                            currentToken.value,
                                                        blockedStatus:
                                                            'unblocked',
                                                      );
                                                    },
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: CustomColors
                                                                .activeTabBarColor)),
                                                    child: Icon(
                                                      Icons.more_horiz_outlined,
                                                      size: 2.3.h,
                                                      color: CustomColors
                                                          .activeTabBarColor,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ))
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
