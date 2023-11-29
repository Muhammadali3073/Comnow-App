import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'utils/color_data.dart';
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
    Future.delayed(const Duration(seconds: 3), () => Get.offAll(const WelcomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [topBackgroundColor, bottomBackgroundColor])),
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
