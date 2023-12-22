import 'package:comnow/utils/constant.dart';
import 'package:comnow/view/navBarScreen/admin_nav_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/authScreens/welcome_screen.dart';
import 'view/widgets/widget_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    alreadyLogin();
    super.initState();
  }

  alreadyLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Future.delayed(
        const Duration(seconds: 3),
        () => sharedPreferences.getBool('isAdminLogin') == true
            ? Get.offAll(() => const AdminBottomNavigationBarScreen())
            : Get.offAll(() => const WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: Constant.authGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 22.h, right: 7.5.h, left: 7.5.h),
            child: getAssetPng('splash_logo.png'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.4.h),
            child:
                getSvgImage('splash_bottom_design.svg', boxFit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
