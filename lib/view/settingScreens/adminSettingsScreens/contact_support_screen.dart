import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../widgets/widget_utils.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Contact Support',
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
        padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 3.2.h),
        decoration: const BoxDecoration(
            gradient: Constant.appGradient),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(1.6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.8.h),
                color: CustomColors.toastColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone_in_talk_rounded,
                          size: 18.px,
                          color: CustomColors.whiteButtonColor,
                        ),
                        getHorSpace(1.h),
                        customWhiteMediumText(
                          text: '( +41 ) 79 713 66 66',
                          fontFamily: Constant.fontsFamilyRegular,
                          fontSize: 15.sp,
                        )
                      ],
                    ),
                    getVerSpace(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email_rounded,
                          size: 18.px,
                          color: CustomColors.whiteButtonColor,
                        ),
                        getHorSpace(1.h),
                        customWhiteMediumText(
                          text: 'info@com-now.ch',
                          fontFamily: Constant.fontsFamilyRegular,
                          fontSize: 15.sp,
                        )
                      ],
                    ),
                    getVerSpace(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.link_rounded,
                          size: 18.px,
                          color: CustomColors.whiteButtonColor,
                        ),
                        getHorSpace(1.h),
                        customWhiteMediumText(
                          text: 'www.com-now.ch',
                          fontFamily: Constant.fontsFamilyRegular,
                          fontSize: 15.sp,
                        )
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
