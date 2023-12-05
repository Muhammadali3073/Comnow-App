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
              bottomBackgroundColor,
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.h),
                            child: customWhiteMediumText(
                              text: 'Select color',
                              fontFamily: Constant.fontsFamilyRegular,
                              fontSize: 14.sp,
                            ),
                          ),
                          getVerSpace(0.7.h),
                          Container(
                            alignment: Alignment.center,
                            height: 3.h,
                            child: ListView.builder(
                              itemCount: dataFile.initialsColorModel.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    initialColor.value = dataFile
                                        .initialsColorModel[index].color!;
                                  },
                                  child: CircleAvatar(
                                    radius: 2.2.h,
                                    backgroundColor: dataFile
                                        .initialsColorModel[index].color,
                                  ),
                                );
                              },
                            ),
                          )
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
