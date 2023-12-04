import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../widgets/widget_utils.dart';
import 'all_team_member_screen.dart';

class MyTeamScreen extends StatefulWidget {
  const MyTeamScreen({super.key});

  @override
  State<MyTeamScreen> createState() => _MyTeamScreenState();
}

class _MyTeamScreenState extends State<MyTeamScreen>
    {
  var isSelected = 2.obs;
  var changeColor = true.obs;
  var reverseSort = true.obs;
  var appBarHeight = AppBar().preferredSize.height - 0.4.h;

  // Popup Menu Item Routes
  onMenuItemSelected(int value) {
    if (value == Options.addMember.index) {
    } else if (value == Options.pingToAll.index) {
    } else if (value == Options.sendMessageToAll.index) {
    } else if (value == Options.sendVoiceTolAll.index) {
    } else if (value == Options.sort.index) {
      sortingDialogBox(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: titleBlackTextColor,
          centerTitle: true,
          title: customWhiteMediumText(
              text: 'My Team',
              fontFamily: Constant.fontsFamilyBold,
              fontSize: 16.sp),
          actions: [
            PopupMenuButton(
              iconColor: whiteButtonColor,
              color: textFormFieldBackgroundColor,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              constraints: BoxConstraints.tight(Size(24.h, 25.h)),
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
                buildPopupMenuItem(
                  'Add member',
                  'add_person.svg',
                  Options.addMember.index,
                  0,
                ),
                buildPopupMenuItem(
                  'Ping to all',
                  'phone_ring.svg',
                  Options.pingToAll.index,
                  1,
                ),
                buildPopupMenuItem(
                  'Send a message to all',
                  'message.svg',
                  Options.sendMessageToAll.index,
                  2,
                ),
                buildPopupMenuItem(
                  'Send voice message to all',
                  'mic.svg',
                  Options.sendVoiceTolAll.index,
                  3,
                ),
                buildPopupMenuItem(
                  'Sort',
                  'sort.svg',
                  Options.sort.index,
                  4,
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: tabBar.preferredSize,
            child: ColoredBox(
              color: tabBarColor,
              child: tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // first outer tab bar view widget
            const AllTeamMemberScreen(),
            // second outer tab bar view widget
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.only(
                  top: 4.h, left: 5.5.h, right: 5.5.h, bottom: 7.6.h),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [topBackgroundColor, bottomBackgroundColor])),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sortingDialogBox(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            surfaceTintColor: Colors.transparent,
            backgroundColor: textFormFieldBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.px)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customWhiteMediumText(
                    text: 'Sorting By',
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 16.sp),
                InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.close,
                      color: redColor,
                      size: 2.5.h,
                    ))
              ],
            ),
            content: SizedBox(
                height: 12.h,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Obx(() => sortButton(
                              DataFile.sortModel[0].name.toString(),
                              isSelected.value,
                              0,
                              onTap: () {
                                isSelected.value = 0;
                                Get.back();
                              },
                            )),
                        Divider(
                          color: tabBarTextColor,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => sortButton(
                            DataFile.sortModel[1].name.toString(),
                            isSelected.value,
                            1,
                            onTap: () {
                              isSelected.value = 1;
                              Get.back();
                            },
                          ),
                        ),
                        Divider(
                          color: tabBarTextColor,
                        )
                      ],
                    ),
                    Obx(
                      () => sortButton(
                        DataFile.sortModel[2].name.toString(),
                        isSelected.value,
                        2,
                        onTap: () {
                          isSelected.value = 2;
                          Get.back();
                        },
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
