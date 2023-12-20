import 'dart:developer';
import 'dart:io';

import 'package:comnow/view/notificationScreens/admin_notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../settingScreens/adminSettingsScreens/admin_setting_screen.dart';
import '../teamScreens/adminScreensOfTeamTab/admin_my_team_screen.dart';
import '../widgets/widget_utils.dart';

class AdminBottomNavigationBarScreen extends StatefulWidget {
  const AdminBottomNavigationBarScreen({super.key});

  @override
  State<AdminBottomNavigationBarScreen> createState() =>
      _AdminBottomNavigationBarScreenState();
}

class _AdminBottomNavigationBarScreenState
    extends State<AdminBottomNavigationBarScreen> {
  var selectedIndex = 0.obs;
  var isNotifications = false.obs;
  static const List<Widget> widgetOptions = <Widget>[
    AdminMyTeamScreen(),
    AdminNotificationScreen(),
    AdminSettingsScreen(),
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
              splashColor: CustomColors.titleBlackTextColor,
              highlightColor: CustomColors.titleBlackTextColor,
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
              backgroundColor: CustomColors.titleBlackTextColor,
              currentIndex: selectedIndex.value,
              selectedItemColor: CustomColors.blueButtonColor,
              unselectedItemColor: CustomColors.textFormFieldBackgroundColor,
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
