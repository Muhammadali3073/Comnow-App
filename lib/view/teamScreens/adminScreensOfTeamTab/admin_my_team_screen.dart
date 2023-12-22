import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/add_member_screen.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/message_templates_screen.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/voice_message_screen.dart';
import '../../widgets/widget_utils.dart';
import 'all_team_member_screen.dart';
import 'group_screen.dart';

class AdminMyTeamScreen extends StatefulWidget {
  const AdminMyTeamScreen({super.key});

  @override
  State<AdminMyTeamScreen> createState() => _AdminMyTeamScreenState();
}

class _AdminMyTeamScreenState extends State<AdminMyTeamScreen> {
  TextEditingController createGroupController = TextEditingController();

  DataFile dataFile = DataFile();
  var isPingToAll = false.obs;
  var isSelectedSortItem = 2.obs;
  var changeColor = true.obs;
  var reverseSort = true.obs;
  var isGroup = false.obs;
  var appBarHeight = AppBar().preferredSize.height - 0.4.h;

  // Outer Tab bar
  TabBar get tabBar => TabBar(
        indicatorColor: CustomColors.blueButtonColor,
        dividerColor: CustomColors.tabBarColor,
        indicatorPadding: EdgeInsets.zero,
        labelColor: CustomColors.blueTextColor,
        unselectedLabelColor: CustomColors.tabBarTextColor,
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor:
            MaterialStatePropertyAll(CustomColors.blueButtonColor.withOpacity(0.1)),
        indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
          color: CustomColors.blueTextColor,
          width: 1,
        )),
        labelStyle:
            TextStyle(fontSize: 14.sp, fontFamily: Constant.fontsFamilyMedium),
        unselectedLabelStyle:
            TextStyle(fontSize: 14.sp, fontFamily: Constant.fontsFamilyMedium),
        tabs: const <Widget>[
          Tab(
            text: 'All Team Members',
          ),
          Tab(
            text: 'Groups ',
          ),
        ],
        onTap: (value) {
          value == 0 ? isGroup.value = false : isGroup.value = true;
        },
      );

  // Popup Menu Item Routes
  onMenuItemSelected(int value) {
    if (value == OptionsForAllMembers.addMember.index) {
      Get.to(() => const AddMemberScreen());
    } else if (value == OptionsForAllMembers.pingToAll.index) {
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
    } else if (value == OptionsForAllMembers.sendMessageToAll.index) {
      Get.to(() => const MessageTemplatesScreen());
    } else if (value == OptionsForAllMembers.sendVoiceTolAll.index) {
      Get.to(() => const VoiceMessageScreen());
    } else if (value == OptionsForAllMembers.sort.index) {
      sortingDialogBox(context, dataFile,
          isSelectedSort: RxInt(isSelectedSortItem.value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.titleBlackTextColor,
            centerTitle: true,
            title: customWhiteMediumText(
                text: 'My Team',
                fontFamily: Constant.fontsFamilyBold,
                fontSize: 16.sp),
            actions: [
              isGroup.value
                  ? IconButton(
                      onPressed: () {
                        sortingDialogBox(context, dataFile,
                            isSelectedSort: RxInt(isSelectedSortItem.value));
                      },
                      icon: Row(
                        children: [
                          getSvgImage('sort_white.svg',
                              color: CustomColors.whiteButtonColor, width: 3.h, height: 3.h),
                          getHorSpace(0.4.h),
                          customWhiteMediumText(
                              text: 'Sort',
                              fontSize: 14.sp,
                              fontFamily: Constant.fontsFamilyRegular),
                          getHorSpace(1.h),
                        ],
                      ))
                  : PopupMenuButton(
                      iconColor: CustomColors.whiteButtonColor,
                      color: CustomColors.popupMenuColor,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      constraints: BoxConstraints.tight(Size(24.5.h, 220)),
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
                        allMemberPopupMenuItem(
                          'Add member',
                          'add_person.svg',
                          OptionsForAllMembers.addMember.index,
                          0,
                        ),
                        allMemberPopupMenuItem(
                          'Ping to all',
                          'phone_ring.svg',
                          OptionsForAllMembers.pingToAll.index,
                          1,
                        ),
                        allMemberPopupMenuItem(
                          'Sent a message to all',
                          'message.svg',
                          OptionsForAllMembers.sendMessageToAll.index,
                          2,
                        ),
                        allMemberPopupMenuItem(
                          'Sent voice message to all',
                          'mic.svg',
                          OptionsForAllMembers.sendVoiceTolAll.index,
                          3,
                        ),
                        allMemberPopupMenuItem(
                          'Sort',
                          'sort.svg',
                          OptionsForAllMembers.sort.index,
                          4,
                        ),
                      ],
                    )
            ],
            bottom: PreferredSize(
              preferredSize: tabBar.preferredSize,
              child: ColoredBox(
                color: CustomColors.tabBarColor,
                child: tabBar,
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                gradient: Constant.appGradient),
            child: TabBarView(
              children: <Widget>[
                // first outer tab bar view widget
                AllTeamMemberScreen(isPingToAll: RxBool(isPingToAll.value)),
                // second outer tab bar view widget
                const GroupScreen(),
              ],
            ),
          ),
          floatingActionButton: isGroup.value
              ? FloatingActionButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  backgroundColor: CustomColors.textFormFieldBackgroundColor,
                  mini: false,
                  shape: const CircleBorder(side: BorderSide.none),
                  child: getSvgImage('floating_button_icon.svg',
                      width: 3.h, height: 3.h),
                  onPressed: () {
                    createGroupDialogBox(
                      context,
                      createGroupController: createGroupController,
                      dialogBoxTitle: 'Create Group',
                      onCreateTitle: 'Create',
                      onCreate: () {
                        if (createGroupController.text.isNotEmpty) {
                          Get.back();
                          Fluttertoast.showToast(
                              msg:
                                  "${createGroupController.text} created successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: CustomColors.toastColor,
                              textColor: CustomColors.titleWhiteTextColor,
                              fontSize: 14.sp);
                          createGroupController.clear();
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Group name not be empty.',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: CustomColors.toastColor,
                              textColor: CustomColors.titleWhiteTextColor,
                              fontSize: 14.sp);
                        }
                      },
                    );
                  },
                )
              : Container(),
        ),
      ),
    );
  }
}
