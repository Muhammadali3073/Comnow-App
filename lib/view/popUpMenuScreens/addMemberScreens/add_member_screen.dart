import 'package:comnow/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../widgets/widget_utils.dart';
import 'generate_qr_code_screen.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  var initialsString = ''.obs;
  Rx<Color> initialColor = topButtonColor.obs;
  DataFile dataFile = DataFile();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding:
                EdgeInsets.only(top: 4.h, bottom: 16.h, left: 4.h, right: 4.h),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              topBackgroundColor,
              bottomBackgroundColor,          bottomBackgroundColor,

                  topBackgroundColor,
            ])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 5.h,
                        backgroundColor: initialColor.value,
                        child: customWhiteMediumText(
                            text: initialsString.value.toString().toUpperCase(),
                            fontSize: 18.sp),
                      ),
                      getVerSpace(2.5.h),
                      addMemberTextField(
                        titleText: 'First name',
                        hintText: 'Enter first name',
                      ),
                      getVerSpace(1.6.h),
                      addMemberTextField(
                        titleText: 'Last name',
                        hintText: 'Enter last name',
                      ),
                      getVerSpace(1.6.h),
                      addMemberTextField(
                          titleText: 'Initials',
                          hintText: 'Enter Initials',
                          onChanged: (value) {
                            initialsString.value = value;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                          ]),
                      getVerSpace(2.4.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customWhiteMediumText(
                            text: 'Select color',
                            fontFamily: Constant.fontsFamilyRegular,
                            fontSize: 14.sp,
                          ),
                          getVerSpace(0.7.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[0].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[0].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[1].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[1].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[2].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[2].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[3].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[3].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[4].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[4].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[5].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[5].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[6].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[6].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[7].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[7].color,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(
                                  1.5.h,
                                ),
                                onTap: () {
                                  initialColor.value =
                                      dataFile.initialsColorModel[8].color!;
                                },
                                child: CircleAvatar(
                                  radius: 1.5.h,
                                  backgroundColor:
                                      dataFile.initialsColorModel[8].color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.h),
                    child: gradientButton(
                      'Next',
                      onTap: () => Get.to(() => const GenerateQRCodeScreen()),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
