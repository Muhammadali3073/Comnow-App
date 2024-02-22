import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../widgets/widget_utils.dart';
import 'share_qr_code_screen.dart';

class GenerateQRCodeScreen extends StatelessWidget {
  const GenerateQRCodeScreen({super.key, required this.enrollmentCode,required this.fullName});

  final String enrollmentCode;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Add Member',
            fontFamily: Constants.fontsFamilyBold,
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
        decoration: const BoxDecoration(gradient: Constants.appGradient),
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
                fontFamily: Constants.fontsFamilyRegular,
                textAlign: TextAlign.center,
              ),
              getVerSpace(4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                child: gradientButton(
                  'Generate QR Code',
                  onTap: () => Get.to(() => ShareQRCodeScreen(
                    enrollmentCode: enrollmentCode,
                    fullName: fullName,
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
