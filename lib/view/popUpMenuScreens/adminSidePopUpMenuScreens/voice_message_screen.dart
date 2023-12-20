import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../widgets/widget_utils.dart';

class VoiceMessageScreen extends StatefulWidget {
  const VoiceMessageScreen({super.key});

  @override
  State<VoiceMessageScreen> createState() => _VoiceMessageScreenState();
}

class _VoiceMessageScreenState extends State<VoiceMessageScreen> {
  DataFile dataFile = DataFile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Voice Message',
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
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              CustomColors.topBackgroundColor,
              CustomColors.bottomBackgroundColor,          CustomColors.bottomBackgroundColor,

              CustomColors.topBackgroundColor,
        ])),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customWhiteMediumText(
                      text: 'Press and hold to start',
                      fontFamily: Constant.fontsFamilyRegular,
                      fontSize: 14.sp,
                    ),
                    getVerSpace(1.h),
                    getSvgImage(
                      'press_to_voice.svg',
                    )
                  ],
                ),
                getVerSpace(8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.0.h),
                  child: gradientButton(
                    'Send',
                    onTap: () {
                      Get.back();
                      Fluttertoast.showToast(
                          msg: "Sent voice message to all successfully ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: CustomColors.toastColor,
                          textColor: CustomColors.titleWhiteTextColor,
                          fontSize: 14.sp);
                    },
                  ),
                ),
                getVerSpace(3.h),
              ]),
        ),
      ),
    );
  }
}
