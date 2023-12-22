import 'package:comnow/view/popUpMenuScreens/adminSidePopUpMenuScreens/voice_message_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/add_member_screen.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/share_qr_code_screen.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/message_templates_screen.dart';
import '../../widgets/widget_utils.dart';

//ignore: must_be_immutable
class SeparateGroupScreen extends StatefulWidget {
  SeparateGroupScreen({super.key, this.titleOfGroup, this.groupMemberList});

  String? titleOfGroup;
  List<MemberModel>? groupMemberList;

  @override
  State<SeparateGroupScreen> createState() => _SeparateGroupScreenState();
}

class _SeparateGroupScreenState extends State<SeparateGroupScreen>
    with SingleTickerProviderStateMixin {
  DataFile dataFile = DataFile();
  var isPingToAll = false.obs;
  var isSelectedSortItem = 2.obs;
  var appBarHeight = AppBar().preferredSize.height - 0.4.h;
  TextEditingController createGroupController = TextEditingController();

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  // Popup Menu Item Routes
  onMenuItemSelected(int value) {
    if (value == OptionsForGroups.addMember.index) {
      Get.to(() => const AddMemberScreen());
    } else if (value == OptionsForGroups.pingToAll.index) {
      isPingToAll.value = true;
      Fluttertoast.showToast(
          msg: "Ping to all sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: CustomColors.toastColor,
          textColor: CustomColors.titleWhiteTextColor,
          fontSize: 14.sp);
      Future.delayed(
        const Duration(seconds: 5),
        () => isPingToAll.value = false,
      );
    } else if (value == OptionsForGroups.sendMessageToAll.index) {
      Get.to(() => const MessageTemplatesScreen());
    } else if (value == OptionsForGroups.sendVoiceTolAll.index) {
      Get.to(() => const VoiceMessageScreen());
    } else if (value == OptionsForGroups.deleteGroup.index) {
      deleteGroupDialogBox(
        context,
        groupName: widget.titleOfGroup,
        onCreate: () {
          Get.back();
          Get.back();
          Fluttertoast.showToast(
              msg: "${widget.titleOfGroup} deleted successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: CustomColors.toastColor,
              textColor: CustomColors.titleWhiteTextColor,
              fontSize: 14.sp);
        },
      );
    } else if (value == OptionsForGroups.sort.index) {
      sortingDialogBox(context, dataFile,
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
            Fluttertoast.showToast(
                msg: "${createGroupController.text} rename successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: CustomColors.toastColor,
                textColor: CustomColors.titleWhiteTextColor,
                fontSize: 14.sp);
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
            fontFamily: Constant.fontsFamilyBold,
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
        decoration: const BoxDecoration(
            gradient: Constant.appGradient),
        child: Column(
          children: [
            Container(
              color: CustomColors.tabBarColor,
              padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 1.5.h),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customWhiteMediumText(
                      text: widget.titleOfGroup.toString(),
                      fontSize: 15.sp,
                      fontFamily: Constant.fontsFamilyRegular,
                    ),
                    customWhiteMediumText(
                      text: 'Total Member(${widget.groupMemberList!.length})',
                      fontSize: 15.sp,
                      fontFamily: Constant.fontsFamilyRegular,
                    ),
                  ]),
            ),
            Container(
              height: 3.8.h,
              margin: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 2.4.h),
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
                          'All (${widget.groupMemberList!.where((element) => element.isBlocked == false).length})',
                    ),
                    Tab(
                      text:
                          'Blocked (${widget.groupMemberList!.where((element) => element.isBlocked == true).length})',
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
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                    ),
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        final newIdx =
                            newIndex > oldIndex ? newIndex - 1 : newIndex;
                        final item = dataFile.memberList.removeAt(oldIndex);
                        dataFile.memberList.insert(newIdx, item);
                      },
                      shrinkWrap: true,
                      children: [
                        for (final item in widget.groupMemberList!
                            .where((element) => element.isBlocked == false))
                          Container(
                            key: Key(item.uniqueId.toString()),
                            margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                            // Show Cards in List
                            child: mainMemberCard(
                              item,
                              isPingToAll: isPingToAll.value,
                              onTap: () => item.type == 'Left team'
                                  ? leftMemberDialogBox(
                                      context,
                                      item.firstName,
                                      onRemoveTap: () {
                                        Get.back();
                                        Fluttertoast.showToast(
                                            msg:
                                                "${item.firstName} is removed successfully",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: CustomColors.toastColor,
                                            textColor: CustomColors.titleWhiteTextColor,
                                            fontSize: 14.sp);
                                      },
                                      onScanTap: () {
                                        Get.back();
                                        Get.to(() => ShareQRCodeScreen(
                                              memberName: item.firstName,
                                            ));
                                      },
                                    )
                                  : memberCardBottomSheet(
                                      context,
                                      pingOnTap: () {
                                        Get.back();
                                      },
                                      textMessageOnTap: () {
                                        Get.back();
                                        Get.to(() =>
                                            const MessageTemplatesScreen());
                                      },
                                      voiceMessageOnTap: () {
                                        Get.back();
                                        Get.to(
                                            () => const VoiceMessageScreen());
                                      },
                                      blockOnTap: () {
                                        Get.back();
                                        blockDialogBox(
                                          context,
                                          userName: item.firstName,
                                          onCreate: () {
                                            Get.back();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "${item.firstName} is blocked now",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: CustomColors.toastColor,
                                                textColor: CustomColors.titleWhiteTextColor,
                                                fontSize: 14.sp);
                                          },
                                        );
                                      },
                                      deleteOnTap: () {
                                        Get.back();
                                        deleteGroupDialogBox(
                                          context,
                                          groupName: item.firstName,
                                          onCreate: () {
                                            Get.back();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "${item.firstName} is deleted",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: CustomColors.toastColor,
                                                textColor: CustomColors.titleWhiteTextColor,
                                                fontSize: 14.sp);
                                          },
                                        );
                                      },
                                      editOnTap: () {
                                        Get.back();
                                        editUserDialogBox(
                                          context,
                                          dataFile,
                                          initialColor:
                                              Rx(item.initialBGColor!),
                                          initialsString:
                                              RxString(item.initialName!),
                                          onCreate: () {
                                            Get.back();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "${item.firstName} is edited successfully",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: CustomColors.toastColor,
                                                textColor: CustomColors.titleWhiteTextColor,
                                                fontSize: 14.sp);
                                          },
                                        );
                                      },
                                    ),
                            ),
                          )
                      ],
                    ),
                  ),

                  // second inner tab bar view widget
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                    ),
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        final newIdx =
                            newIndex > oldIndex ? newIndex - 1 : newIndex;
                        final item = dataFile.memberList.removeAt(oldIndex);
                        dataFile.memberList.insert(newIdx, item);
                      },
                      shrinkWrap: true,
                      children: [
                        for (final item in widget.groupMemberList!
                            .where((element) => element.isBlocked == true))
                          Container(
                              key: Key(item.uniqueId.toString()),
                              margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                              // Show Cards in List
                              child: mainMemberCard(
                                item,
                                onTap: () {
                                  unblockedDialogBox(
                                    context,
                                    item.firstName,
                                    onUnblock: () {
                                      Get.back();
                                      Fluttertoast.showToast(
                                          msg:
                                              "${item.firstName} unblocked successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: CustomColors.toastColor,
                                          textColor: CustomColors.titleWhiteTextColor,
                                          fontSize: 14.sp);
                                    },
                                  );
                                },
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
    );
  }
}
