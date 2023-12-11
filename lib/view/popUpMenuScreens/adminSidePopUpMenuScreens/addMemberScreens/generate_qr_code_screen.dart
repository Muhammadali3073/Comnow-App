import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../widgets/widget_utils.dart';
import 'share_qr_code_screen.dart';

class GenerateQRCodeScreen extends StatelessWidget {
  const GenerateQRCodeScreen({super.key});

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
          bottomBackgroundColor,          bottomBackgroundColor,

              topBackgroundColor,
        ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getSvgImage('qr_icon.svg'),
              getVerSpace(2.h),
              customWhiteMediumText(
                text:
                    'Please click on the button to generate\na QR code for your team member.',
                fontSize: 14.sp,
                fontFamily: Constant.fontsFamilyRegular,
                textAlign: TextAlign.center,
              ),
              getVerSpace(4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                child: gradientButton(
                  'Generate QR Code',
                  onTap: () => Get.to(() =>  ShareQRCodeScreen(memberName: 'Mohsin',)),
                ),
              ),
            ]),
      ),
    );
  }
}
