import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../widgets/widget_utils.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List languagesList = [
    "English",
    "German",
    "Spanish",
    "French",
    "Italian",
  ];

  setCurrentSelectedLanguage(selectedLanguage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('selectedLanguage', selectedLanguage);
  }

  setCurrentSelectedLanguageCode(selectedLanguageCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('selectedLanguageCode', selectedLanguageCode);
  }

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
        decoration: const BoxDecoration(gradient: Constant.appGradient),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: languagesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Get.updateLocale(const Locale('en_US'));
                  setCurrentSelectedLanguageCode('en');
                } else if (index == 1) {
                  Get.updateLocale(const Locale('de_DE'));
                  setCurrentSelectedLanguageCode('de');
                } else if (index == 2) {
                  Get.updateLocale(const Locale('es_ES'));
                  setCurrentSelectedLanguageCode('es');
                } else if (index == 3) {
                  Get.updateLocale(const Locale('fr_FR'));
                  setCurrentSelectedLanguageCode('fr');
                } else if (index == 4) {
                  Get.updateLocale(const Locale('it_IT'));
                  setCurrentSelectedLanguageCode('it');
                }
                setCurrentSelectedLanguage(languagesList[index].toString().tr);
                DataFile.getCurrentLanguage();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.6.h),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: index == languagesList.length - 1
                      ? Colors.transparent
                      : CustomColors.tabBarTextColor,
                ))),
                child: Obx(
                  () => Row(
                    children: [
                      DataFile.selectedLanguage.value.toString().tr ==
                              languagesList[index].toString().tr
                          ? Container(
                              padding: EdgeInsets.all(0.4.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: CustomColors.blueButtonColor,
                                      width: 1.5.px)),
                              child: Container(
                                width: 1.0.h,
                                height: 1.0.h,
                                decoration: BoxDecoration(
                                    color: CustomColors.blueColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: CustomColors.blueButtonColor)),
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
                        text: languagesList[index].toString().tr,
                        color: DataFile.selectedLanguage.value.toString().tr ==
                                languagesList[index].toString().tr
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
