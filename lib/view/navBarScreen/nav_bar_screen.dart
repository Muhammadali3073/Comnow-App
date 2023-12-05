import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../notificationScreens/notification_screen.dart';
import '../settingScreens/setting_screen.dart';
import '../teamScreens/my_team_screen.dart';
import '../widgets/widget_utils.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var selectedIndex = 0.obs;
  var isNotifications = false.obs;
  static const List<Widget> widgetOptions = <Widget>[
    MyTeamScreen(),
    NotificationScreen(),
    SettingsScreen(),
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
              splashColor: blueButtonColor.withOpacity(0.1),
              highlightColor: blueButtonColor.withOpacity(0.1),
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
