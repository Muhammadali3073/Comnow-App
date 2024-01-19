import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../navBarScreen/admin_nav_bar_screen.dart';
import '../../../widgets/widget_utils.dart';

//ignore: must_be_immutable
class ShareQRCodeScreen extends StatefulWidget {
  const ShareQRCodeScreen(
      {super.key, required this.enrollmentCode, required this.fullName});

  final String enrollmentCode;
  final String fullName;

  @override
  State<ShareQRCodeScreen> createState() => _ShareQRCodeScreenState();
}

class _ShareQRCodeScreenState extends State<ShareQRCodeScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  _shareQrCode() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture().then((var image) async {
      if (image != null) {
        try {
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          File imagePath = await File('$directory/$fileName.png').create();
          await imagePath.writeAsBytes(image);
          Share.shareXFiles([XFile(imagePath.path)],
              text: "${widget.fullName} scan QR code to join team.\nComnow App");
        } catch (error) {
          log(error.toString());
        }
      }
    }).catchError((onError) {
      log('Error --->> $onError');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Add Member',
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: CustomColors.whiteButtonColor,
              size: 2.h,
            )),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(horizontal: 9.5.h),
        decoration: const BoxDecoration(gradient: Constant.appGradient),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: screenshotController,
                child: QrImageView(
                  backgroundColor: CustomColors.whiteButtonColor,
                  data: widget.enrollmentCode.toString(),
                  version: QrVersions.auto,
                  size: 20.h,
                ),
              ),
              getVerSpace(3.h),
              customWhiteMediumText(
                text: 'QR code is ready now\nyou can share it with them.',
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
                        _shareQrCode();
                      },
                    ),
                    getVerSpace(1.5.h),
                    gradientButton(
                      'Done',
                      onTap: () => Get.offAll(
                          () => const AdminBottomNavigationBarScreen()),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
