import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../navBarScreen/nav_bar_screen.dart';
import '../../widgets/widget_utils.dart';

//ignore: must_be_immutable
class ShareQRCodeScreen extends StatelessWidget {
  ShareQRCodeScreen({super.key, this.memberName});

  String? memberName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Add Member',
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: whiteButtonColor,
              size: 2.h,
            )),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(horizontal: 9.5.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          topBackgroundColor,
          bottomBackgroundColor,
          bottomBackgroundColor,
          topBackgroundColor,
        ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                backgroundColor: whiteButtonColor,
                data: 'Dat of generating QR Code',
                version: QrVersions.auto,
                size: 20.h,
              ),
              getVerSpace(3.h),
              customWhiteMediumText(
                text:
                    '$memberName QR code is ready now\nyou can share it with them.',
                fontSize: 14.sp,
                fontFamily: Constant.fontsFamilyRegular,
                textAlign: TextAlign.center,
              ),
              getVerSpace(15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0.h),
                child: Column(
                  children: [
                    gradientButton(
                      'Share',
                      onTap: () {
                        Share.share('Share QR Code for adding member.');
                      },
                    ),
                    getVerSpace(1.5.h),
                    gradientButton(
                      'Done',
                      onTap: () =>
                          Get.offAll(() => const BottomNavigationBarScreen()),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
