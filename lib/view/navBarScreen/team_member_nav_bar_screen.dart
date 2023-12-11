import 'dart:developer';
import 'dart:io';

import 'package:comnow/view/notificationScreens/team_member_notification_screen.dart';
import 'package:comnow/view/settingScreens/team_member_settings_screen.dart';
import 'package:comnow/view/teamScreens/teamMemberScreensOfTeamTab/team_member_my_team_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../widgets/widget_utils.dart';

class TeamMemberBottomNavigationBarScreen extends StatefulWidget {
  const TeamMemberBottomNavigationBarScreen({super.key});

  @override
  State<TeamMemberBottomNavigationBarScreen> createState() =>
      _TeamMemberBottomNavigationBarScreenState();
}

class _TeamMemberBottomNavigationBarScreenState
    extends State<TeamMemberBottomNavigationBarScreen> {
  var selectedIndex = 0.obs;
  var isNotifications = false.obs;
  static const List<Widget> widgetOptions = <Widget>[
    TeamMemberMyTeamScreen(),
    TeamMemberNotificationScreen(),
    TeamMemberSettingsScreen(),
  ];

  void _onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop == false) {
          log(didPop.toString());
          leaveAppDialogBox(
            context,
            onCreate: () {
              Platform.isAndroid ? SystemNavigator.pop() : exit(0);
            },
          );
        }
      },
      child: Obx(
        () => Scaffold(
          body: widgetOptions.elementAt(selectedIndex.value),
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: titleBlackTextColor,
              highlightColor: titleBlackTextColor,
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: getSvgImage(
                    'nav_bar_icon_1.svg',
                  ),
                  icon: getSvgImage(
                    'nav_bar_inactive_icon_1.svg',
                  ),
                  label: 'Team',
                ),
                BottomNavigationBarItem(
                  icon: getSvgImage(
                    isNotifications.value
                        ? 'notifications_icon.svg'
                        : 'nav_bar_inactive_icon_2.svg',
                  ),
                  activeIcon: getSvgImage(
                    'nav_bar_icon_2.svg',
                  ),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  activeIcon: getSvgImage(
                    'nav_bar_icon_3.svg',
                  ),
                  label: 'Setting',
                  icon: getSvgImage(
                    'nav_bar_inactive_icon_3.svg',
                  ),
                ),
              ],
              backgroundColor: titleBlackTextColor,
              currentIndex: selectedIndex.value,
              selectedItemColor: blueButtonColor,
              unselectedItemColor: textFormFieldBackgroundColor,
              selectedFontSize: 14.sp,
              unselectedFontSize: 14.sp,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
