import 'package:comnow/utils/extensions.dart';
import 'package:comnow/view/popUpMenuScreens/adminSidePopUpMenuScreens/voice_message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/groupController/get_groups_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/add_member_screen.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/message_templates_screen.dart';
import '../../widgets/widget_utils.dart';

//ignore: must_be_immutable
class SeparateGroupScreen extends StatefulWidget {
  SeparateGroupScreen({
    super.key,
    this.titleOfGroup,
    this.idOfGroup,
  });

  String? titleOfGroup;
  String? idOfGroup;

  @override
  State<SeparateGroupScreen> createState() => _SeparateGroupScreenState();
}

class _SeparateGroupScreenState extends State<SeparateGroupScreen>
    with SingleTickerProviderStateMixin {
  GetGroupsController getGroupsController =
      Get.find(tag: 'getGroupsController');
  TabController? tabController;

  Rx<Color> initialColor = CustomColors.topButtonColor.obs;

  var isSelectedSortItem = 2.obs;
  var initialColorCode = ''.obs;
  var initialsString = ''.obs;

  var appBarHeight = AppBar().preferredSize.height - 0.4.h;

  TextEditingController createGroupController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController initialsTextController = TextEditingController();

  getMembersInGroup() {
    getGroupsController.handleGetMembersInGroups(
      context,
      Constants.codeOfLanguage.value,
      token: Constants.tokenOfDoctor.value,
      groupId: widget.idOfGroup,
    );
  }

  @override
  void initState() {
    getMembersInGroup();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    getGroupsController.getMemberInGroupsData.value = null;
    tabController!.dispose();
  }

  // Popup Menu Item Routes
  onMenuItemSelected(int value) {
    if (value == OptionsForGroups.addMember.index) {
      Get.to(() => AddMemberScreen(
            routeName: 'group',
            groupId: widget.idOfGroup,
          ));
    } else if (value == OptionsForGroups.pingToAll.index) {
      Fluttertoast.showToast(
          msg: "Ping to all sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: CustomColors.toastColor,
          textColor: CustomColors.titleWhiteTextColor,
          fontSize: 14.sp);
    } else if (value == OptionsForGroups.sendMessageToAll.index) {
      Get.to(() => const MessageTemplatesScreen());
    } else if (value == OptionsForGroups.sendVoiceTolAll.index) {
      Get.to(() => const VoiceMessageScreen());
    } else if (value == OptionsForGroups.deleteGroup.index) {
      deleteGroupDialogBox(context, groupName: widget.titleOfGroup,
          onCreate: () {
        Get.back();
        getGroupsController.handleDeleteGroup(
          context,
          groupId: widget.idOfGroup,
          groupName: widget.titleOfGroup,
          token: Constants.tokenOfDoctor.value,
          language: Constants.codeOfLanguage.value,
        );
      });
    } else if (value == OptionsForGroups.sort.index) {
      sortingDialogBox(context,
          isSelectedSort: RxInt(isSelectedSortItem.value));
    } else if (value == OptionsForGroups.rename.index) {
      createGroupController.text = widget.titleOfGroup.toString();
      createGroupDialogBox(
        context,
        createGroupController: createGroupController,
        dialogBoxTitle: 'Rename',
        onCreateTitle: 'Save',
        onCreate: () {
          Get.back();
          if (createGroupController.text.isNotEmpty) {
            getGroupsController.handleEditGroup(
              context,
              groupName: createGroupController.text.trim(),
              token: Constants.tokenOfDoctor.value,
              language: Constants.codeOfLanguage.value,
              groupId: widget.idOfGroup,
            );
          }
          createGroupController.clear();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: widget.titleOfGroup.toString(),
            fontFamily: Constants.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: CustomColors.whiteButtonColor,
              size: 2.h,
            )),
        actions: [
          PopupMenuButton(
            iconColor: CustomColors.whiteButtonColor,
            color: CustomColors.popupMenuColor,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            constraints: BoxConstraints.tight(Size(24.5.h, 300)),
            onSelected: (value) {
              onMenuItemSelected(value as int);
            },
            offset: Offset(0.0, appBarHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0.px),
                bottomRight: Radius.circular(16.0.px),
              ),
            ),
            itemBuilder: (ctx) => [
              groupPopupMenuItem(
                'Add member',
                'add_person.svg',
                OptionsForGroups.addMember.index,
                0,
              ),
              groupPopupMenuItem(
                'Ping to all',
                'phone_ring.svg',
                OptionsForGroups.pingToAll.index,
                1,
              ),
              groupPopupMenuItem(
                'Sent a message to all',
                'message.svg',
                OptionsForGroups.sendMessageToAll.index,
                2,
              ),
              groupPopupMenuItem(
                'Sent voice message to all',
                'mic.svg',
                OptionsForGroups.sendVoiceTolAll.index,
                3,
              ),
              groupPopupMenuItem(
                'Delete group',
                'delete_icon.svg',
                OptionsForGroups.deleteGroup.index,
                4,
              ),
              groupPopupMenuItem(
                'Sort',
                'sort.svg',
                OptionsForGroups.sort.index,
                5,
              ),
              groupPopupMenuItem(
                'Rename',
                'rename_icon.svg',
                OptionsForGroups.rename.index,
                6,
              ),
            ],
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: Obx(
          () =>
              getGroupsController.loadingAddMemberInGroup.value ||
                      getGroupsController.getMemberInGroupsData.value == null
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
                                    horizontal: 2.4.h, vertical: 1.5.h),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      customWhiteMediumText(
                                        text: '',
                                        fontSize: 15.sp,
                                        fontFamily:
                                            Constants.fontsFamilyRegular,
                                      ),
                                      customWhiteMediumText(
                                        text: '',
                                        fontSize: 15.sp,
                                        fontFamily:
                                            Constants.fontsFamilyRegular,
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
                                  color:
                                      CustomColors.textFormFieldBackgroundColor,
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
                                        color: CustomColors
                                            .textFormFieldBackgroundColor,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.4.h, vertical: 1.5.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customWhiteMediumText(
                                  text: widget.titleOfGroup.toString(),
                                  fontSize: 15.sp,
                                  fontFamily: Constants.fontsFamilyRegular,
                                ),
                                customWhiteMediumText(
                                  text:
                                      'Total Member(${getGroupsController.getMemberInGroupsData.value!.data!.teamMembers!.length})',
                                  fontSize: 15.sp,
                                  fontFamily: Constants.fontsFamilyRegular,
                                ),
                              ]),
                        ),
                        Container(
                          height: 3.8.h,
                          margin: EdgeInsets.symmetric(
                              vertical: 2.4.h, horizontal: 2.4.h),
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
                                fontFamily: Constants.fontsFamilyRegular,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: Constants.fontsFamilyRegular,
                              ),
                              labelColor: CustomColors.titleBlackTextColor,
                              unselectedLabelColor:
                                  CustomColors.titleWhiteTextColor,
                              tabs: [
                                Tab(
                                  text:
                                      'All (${getGroupsController.getMemberInGroupsData.value!.data!.teamMembers!.where((element) => element.blocked == false).length})',
                                ),
                                Tab(
                                  text:
                                      'Blocked (${getGroupsController.getMemberInGroupsData.value!.data!.teamMembers!.where((element) => element.blocked == true).length})',
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
                              getGroupsController.loadingGetMembersInGroup.value
                                  ? SizedBox(
                                      child: Shimmer.fromColors(
                                          baseColor: CustomColors
                                              .bottomBackgroundColor,
                                          highlightColor: Colors.black12,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: getGroupsController
                                                        .getMemberInGroupsData
                                                        .value!
                                                        .data!
                                                        .teamMembers ==
                                                    null
                                                ? 1
                                                : getGroupsController
                                                    .getMemberInGroupsData
                                                    .value!
                                                    .data!
                                                    .teamMembers!
                                                    .where((element) =>
                                                        element.blocked ==
                                                        false)
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
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                .getMemberInGroupsData
                                                .value!
                                                .data!
                                                .teamMembers!
                                                .removeAt(oldIndex);
                                            getGroupsController
                                                .getMemberInGroupsData
                                                .value!
                                                .data!
                                                .teamMembers!
                                                .insert(newIdx, item);
                                          });
                                        },
                                        shrinkWrap: true,
                                        children: [
                                          for (final item in getGroupsController
                                              .getMemberInGroupsData
                                              .value!
                                              .data!
                                              .teamMembers!
                                              .where((element) =>
                                                  element.blocked == false))
                                            Container(
                                                key: Key(item.id.toString()),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.4.h),
                                                // Show Cards in List
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.5.h,
                                                      vertical: 1.h),
                                                  margin: EdgeInsets.only(
                                                      bottom: 1.4.h),
                                                  decoration: BoxDecoration(
                                                    color: item.leavedTeam ==
                                                                true &&
                                                            item.blocked ==
                                                                false
                                                        ? CustomColors
                                                            .leftMemberBGCardColor
                                                        : CustomColors
                                                            .textFormFieldBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
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
                                                                  fontFamily: Constants
                                                                      .fontsFamilyRegular,
                                                                ),
                                                                getVerSpace(0.4.h),
                                                                item.blocked == true
                                                                    ? const SizedBox
                                                                    .shrink()
                                                                    : customWhiteMediumText(
                                                                  text: item.isOnline ==
                                                                      true &&
                                                                      item.leavedTeam ==
                                                                          false
                                                                      ? 'Online'
                                                                      : item.isOnline ==
                                                                      false &&
                                                                      item.leavedTeam ==
                                                                          false
                                                                      ? 'Offline'
                                                                      : 'Left team',
                                                                  color: item.isOnline ==
                                                                      true &&
                                                                      item.leavedTeam ==
                                                                          false
                                                                      ? CustomColors
                                                                      .greenColor
                                                                      : item.isOnline ==
                                                                      false &&
                                                                      item.leavedTeam ==
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
                                                                  fontFamily:
                                                                  Constants
                                                                      .fontsFamilyRegular,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            item.blocked == true
                                                                ? const SizedBox
                                                                .shrink()
                                                                : CircleAvatar(
                                                              radius: 0.5.h,
                                                              backgroundColor: item
                                                                  .isOnline ==
                                                                  true &&
                                                                  item.leavedTeam ==
                                                                      false
                                                                  ? CustomColors
                                                                  .greenColor
                                                                  : item.isOnline ==
                                                                  false &&
                                                                  item.leavedTeam ==
                                                                      false
                                                                  ? CustomColors
                                                                  .redColor
                                                              //         : listOfMembers
                                                              //                     .type ==
                                                              //                 'Away'
                                                              //             ? CustomColors
                                                              //                 .yellowColor

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
                                                                      onRemoveTap:
                                                                          () {
                                                                        Get.back();
                                                                        getGroupsController
                                                                            .handleDeleteMember(
                                                                          context,
                                                                          Constants
                                                                              .defaultTeamIdOfDoctor
                                                                              .value,
                                                                          groupId:
                                                                              widget.idOfGroup,
                                                                          userName:
                                                                              item.fullName,
                                                                          teamMemberId:
                                                                              item.id,
                                                                          token: Constants
                                                                              .tokenOfDoctor
                                                                              .value,
                                                                        );
                                                                      },
                                                                      onScanTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                    )
                                                                  : memberCardBottomSheet(
                                                                      context,
                                                                      pingOnTap:
                                                                          () {
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
                                                                      blockOnTap:
                                                                          () {
                                                                        Get.back();

                                                                        blockDialogBox(
                                                                          context,
                                                                          userName:
                                                                              item.fullName,
                                                                          onCreate:
                                                                              () {
                                                                            Get.back();

                                                                            getGroupsController.handleEditMemberStatus(
                                                                              context,
                                                                              Constants.defaultTeamIdOfDoctor.value,
                                                                              language: Constants.codeOfLanguage.value,
                                                                              userName: item.fullName,
                                                                              groupId: widget.idOfGroup,
                                                                              teamMemberId: item.id,
                                                                              token: Constants.tokenOfDoctor.value,
                                                                              blockedStatus: 'blocked',
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      deleteOnTap:
                                                                          () {
                                                                        Get.back();
                                                                        deleteGroupDialogBox(
                                                                          context,
                                                                          groupName:
                                                                              item.fullName,
                                                                          onCreate:
                                                                              () {
                                                                            Get.back();
                                                                            getGroupsController.handleDeleteMember(
                                                                              context,
                                                                              Constants.defaultTeamIdOfDoctor.value,
                                                                              groupId: widget.idOfGroup,
                                                                              userName: item.fullName,
                                                                              teamMemberId: item.id,
                                                                              token: Constants.tokenOfDoctor.value,
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      editOnTap:
                                                                          () {
                                                                        initialColor.value = item
                                                                            .color!
                                                                            .toColor();
                                                                        initialsString.value =
                                                                            item.initials!;

                                                                        var splitIndex = item
                                                                            .fullName!
                                                                            .indexOf(' ');

                                                                        firstNameTextController.text = item
                                                                            .fullName!
                                                                            .substring(0,
                                                                                splitIndex)
                                                                            .trim();
                                                                        lastNameTextController.text = item
                                                                            .fullName!
                                                                            .substring(splitIndex +
                                                                                1)
                                                                            .trim();
                                                                        initialsTextController.text =
                                                                            item.initials!;

                                                                        Get.back();

                                                                        showDialog<
                                                                            void>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return AlertDialog(
                                                                                contentPadding: EdgeInsets.zero,
                                                                                surfaceTintColor: Colors.transparent,
                                                                                backgroundColor: CustomColors.dialogBoxColor,
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.px)),
                                                                                title: Obx(
                                                                                  () => CircleAvatar(
                                                                                    radius: 5.h,
                                                                                    backgroundColor: initialColor.value,
                                                                                    child: customWhiteMediumText(text: initialsString.value.toString().toUpperCase(), fontSize: 18.sp),
                                                                                  ),
                                                                                ),
                                                                                content: SingleChildScrollView(
                                                                                  child: SizedBox(
                                                                                      child: Padding(
                                                                                    padding: EdgeInsets.only(left: 1.6.h, right: 1.6.h, bottom: 2.6.h),
                                                                                    child: Column(
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
                                                                                                  fontFamily: Constants.fontsFamilyRegular,
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
                                                                                                  Constants.defaultTeamIdOfDoctor.value,
                                                                                                  groupId: widget.idOfGroup,
                                                                                                  userName: '${firstNameTextController.text.trim()} ${lastNameTextController.text.trim()}',
                                                                                                  teamMemberId: item.id,
                                                                                                  initialsColor: initialColorCode.value,
                                                                                                  initials: initialsTextController.text,
                                                                                                  fullName: '${firstNameTextController.text} ${lastNameTextController.text}',
                                                                                                  language: Constants.codeOfLanguage.value,
                                                                                                  token: Constants.tokenOfDoctor.value,
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
                                                                    shape: BoxShape
                                                                        .circle,
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
                              getGroupsController.loadingGetMembersInGroup.value
                                  ? SizedBox(
                                      child: Shimmer.fromColors(
                                          baseColor: CustomColors
                                              .bottomBackgroundColor,
                                          highlightColor: Colors.black12,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: getGroupsController
                                                        .getMemberInGroupsData
                                                        .value!
                                                        .data!
                                                        .teamMembers ==
                                                    null
                                                ? 1
                                                : getGroupsController
                                                    .getMemberInGroupsData
                                                    .value!
                                                    .data!
                                                    .teamMembers!
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
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                .getMemberInGroupsData
                                                .value!
                                                .data!
                                                .teamMembers!
                                                .removeAt(oldIndex);
                                            getGroupsController
                                                .getMemberInGroupsData
                                                .value!
                                                .data!
                                                .teamMembers!
                                                .insert(newIdx, item);
                                          });
                                        },
                                        shrinkWrap: true,
                                        children: [
                                          for (final item in getGroupsController
                                              .getMemberInGroupsData
                                              .value!
                                              .data!
                                              .teamMembers!
                                              .where((element) =>
                                                  element.blocked == true))
                                            Container(
                                                key: Key(item.id.toString()),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.4.h),
                                                // Show Cards in List
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.5.h,
                                                      vertical: 1.h),
                                                  margin: EdgeInsets.only(
                                                      bottom: 1.4.h),
                                                  decoration: BoxDecoration(
                                                    color: item.leavedTeam ==
                                                                true &&
                                                            item.blocked ==
                                                                false
                                                        ? CustomColors
                                                            .leftMemberBGCardColor
                                                        : CustomColors
                                                            .textFormFieldBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
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
                                                                  : item.color ==
                                                                          null
                                                                      ? CustomColors
                                                                          .blueColor
                                                                      : item
                                                                          .color!
                                                                          .toColor(),
                                                              child: customWhiteMediumText(
                                                                  text:
                                                                      item.initials ??
                                                                          '',
                                                                  fontSize:
                                                                      14.sp),
                                                            ),
                                                            getHorSpace(1.h),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                customWhiteMediumText(
                                                                  text: item
                                                                      .fullName,
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontFamily:
                                                                      Constants
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
                                                                Constants
                                                                    .defaultTeamIdOfDoctor
                                                                    .value,
                                                                language: Constants
                                                                    .codeOfLanguage
                                                                    .value,
                                                                userName: item
                                                                    .fullName,
                                                                groupId: widget
                                                                    .idOfGroup,
                                                                teamMemberId:
                                                                    item.id,
                                                                token: Constants
                                                                    .tokenOfDoctor
                                                                    .value,
                                                                blockedStatus:
                                                                    'unblocked',
                                                              );
                                                            },
                                                          ),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
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
        ),
      ),
    );
  }
}
