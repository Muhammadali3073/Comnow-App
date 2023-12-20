import 'package:comnow/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../widgets/widget_utils.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  DataFile dataFile = DataFile();
  var isSelected = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Language',
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
        padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 4.0.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          CustomColors.topBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.topBackgroundColor,
        ])),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dataFile.languageList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => isSelected.value = index,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.6.h),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: index == dataFile.languageList.length - 1
                      ? Colors.transparent
                      : CustomColors.tabBarTextColor,
                ))),
                child: Obx(
                  () => Row(
                    children: [
                      isSelected.value == index
                          ? Container(
                              padding: EdgeInsets.all(0.4.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: CustomColors.blueButtonColor, width: 1.5.px)),
                              child: Container(
                                width: 1.0.h,
                                height: 1.0.h,
                                decoration: BoxDecoration(
                                    color: CustomColors.blueColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: CustomColors.blueButtonColor)),
                              ))
                          : Container(
                              padding: EdgeInsets.all(0.4.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: CustomColors.tabBarTextColor,
                                    width: 1.5.px,
                                  )),
                              child: Container(
                                width: 1.0.h,
                                height: 1.0.h,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Colors.transparent)),
                              )),
                      getHorSpace(2.h),
                      customWhiteMediumText(
                        text: dataFile.languageList[index].name.toString(),
                        color: isSelected.value == index
                            ? CustomColors.blueButtonColor
                            : CustomColors.whiteButtonColor,
                        fontSize: 16.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
