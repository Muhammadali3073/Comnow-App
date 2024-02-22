import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../widgets/widget_utils.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Current Subscription',
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
        padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 4.0.h),
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 1.6.h, right: 1.6.h, top: 1.6.h, bottom: 2.4.h),
              decoration: BoxDecoration(
                color: CustomColors.toastColor,
                borderRadius: BorderRadius.circular(
                  8.px,
                ),
              ),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        getSvgImage(
                          'dollar_icon.svg',
                          height: 4.8.h,
                          width: 4.8.h,
                        ),
                        getHorSpace(1.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customWhiteMediumText(
                              text: 'Test version',
                              fontSize: 15.sp,
                            ),
                            customWhiteMediumText(
                                text: 'Started on: 11/08/2023',
                                fontSize: 13.5.sp,
                                fontFamily: Constants.fontsFamilyRegular),
                          ],
                        ),
                      ],
                    ),
                    customWhiteMediumText(
                      text: '90 Days left',
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                getVerSpace(2.4.h),
                customWhiteMediumText(
                    text:
                        'Get our trial test version of our communication app today and experience the benefits of streamlined and efficient communication. With our app, you can easily ping, send messages and voice notes, and manage your team with our efficient control system. Try it out for trial and see for yourself how our app can transform the way vou work. The Test Version subscription includes a 90 day trial period, charges will automatically commence once the trial period concludes',
                    fontSize: 14.sp,
                    textAlign: TextAlign.justify,
                    fontFamily: Constants.fontsFamilyRegular),
                getVerSpace(2.h),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: CustomColors.greenColor,
                      size: 18.sp,
                    ),
                    customWhiteMediumText(
                      text: '   - up to 20 users',
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                getVerSpace(1.h),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: CustomColors.greenColor,
                      size: 18.sp,
                    ),
                    customWhiteMediumText(
                      text: '   - up to 20 text message templates',
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                getVerSpace(1.h),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: CustomColors.greenColor,
                      size: 18.sp,
                    ),
                    customWhiteMediumText(
                      text: '   - unlimited voice messages',
                      fontSize: 15.sp,
                    ),
                  ],
                ),
                getVerSpace(3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customWhiteMediumText(
                      text: 'Terms & Condition',
                      fontSize: 14.sp,
                      fontFamily: Constants.fontsFamilyRegular,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                    customWhiteMediumText(
                      text: 'Privacy Policy',
                      fontSize: 14.sp,
                      fontFamily: Constants.fontsFamilyRegular,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
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
