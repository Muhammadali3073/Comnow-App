import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../widgets/widget_utils.dart';
import 'scan_qr_code_screen.dart';

class LoginWithQRScreen extends StatelessWidget {
  const LoginWithQRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding:
            EdgeInsets.only(top: 4.h, left: 5.5.h, right: 5.5.h, bottom: 7.6.h),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/png/auth_background_image.png'),
                fit: BoxFit.fitWidth),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [topBackgroundColor, bottomBackgroundColor])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: getAssetPng('splash_logo.png'),
                ),
                customWhiteMediumText(
                  text: 'Login with QR',
                  fontSize: 20.px,
                ),
              ],
            ),
            getSvgImage('login_qr.svg', height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.h),
              child: gradientButton(
                'Next',
                onTap: () => Get.to(() => const ScanQRCodeScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}