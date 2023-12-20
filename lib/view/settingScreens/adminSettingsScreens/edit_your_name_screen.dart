import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';
import '../../widgets/widget_utils.dart';

class EditYourNameScreen extends StatelessWidget {
  const EditYourNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameTextController = TextEditingController();
    TextEditingController initialsTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Edit Your Profile',
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
        padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 5.6.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          CustomColors.topBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.topBackgroundColor,
        ])),
        child: Column(children: [
          addMemberTextField(
            controller: fullNameTextController,
            titleText: 'Full name',
            hintText: 'Enter your full name',
          ),
          getVerSpace(1.6.h),
          addMemberTextField(
            controller: initialsTextController,
            titleText: 'Initials',
            hintText: 'Enter initials',
          ),
          getVerSpace(3.2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: gradientButton(
              'Update',
              onTap: () {
                if (Validations.handleEditProfileScreenError(
                  fullNameTextController: fullNameTextController,
                  initialsTextController: initialsTextController,
                ).isNotEmpty) {
                  customScaffoldMessenger(
                    context,
                    Validations.handleEditProfileScreenError(
                      fullNameTextController: fullNameTextController,
                      initialsTextController: initialsTextController,
                    ),
                  );
                } else {
                  Get.back();
                  Fluttertoast.showToast(
                      msg: "Update profile successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: CustomColors.toastColor,
                      textColor: CustomColors.titleWhiteTextColor,
                      fontSize: 14.sp);
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
