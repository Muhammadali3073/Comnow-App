import 'package:comnow/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';
import '../../widgets/widget_utils.dart';

class EditYourNameScreen extends StatefulWidget {
  const EditYourNameScreen({
    super.key,
    required this.initialColor,
    required this.initials,
    required this.fullName,
  });

  final String initialColor;
  final String initials;
  final String fullName;

  @override
  State<EditYourNameScreen> createState() => _EditYourNameScreenState();
}

class _EditYourNameScreenState extends State<EditYourNameScreen> {
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController initialsTextController = TextEditingController();

  dynamic initialColor = CustomColors.hintColor.obs;
  var initialsString = ''.obs;
  var initialColorCode = ''.obs;

  @override
  Widget build(BuildContext context) {
    initialColor.value = widget.initialColor.toColor();
    initialsString.value = widget.initials.toString();
    initialsTextController.text = widget.initials.toString();
    fullNameTextController.text = widget.fullName.toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 5.6.h),
        decoration: const BoxDecoration(gradient: Constant.appGradient),
        child: Column(children: [
          Obx(
            () => CircleAvatar(
              radius: 5.h,
              backgroundColor: initialColor.value,
              child: customWhiteMediumText(
                text: initialsString.value.toString().toUpperCase(),
                fontSize: 18.sp,
              ),
            ),
          ),
          getVerSpace(2.h),
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
          getVerSpace(3.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customWhiteMediumText(
                text: 'Select color',
                fontFamily: Constant.fontsFamilyRegular,
                fontSize: 14.sp,
              ),
              getVerSpace(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#EA2A2A'.toColor();
                      initialColorCode.value = '#EA2A2A';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#EA2A2A'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#E4951F'.toColor();
                      initialColorCode.value = '#E4951F';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#E4951F'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#E4DC1F'.toColor();
                      initialColorCode.value = '#E4DC1F';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#E4DC1F'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#46E41F'.toColor();
                      initialColorCode.value = '#46E41F';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#46E41F'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#1FE4C1'.toColor();
                      initialColorCode.value = '#1FE4C1';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#1FE4C1'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#218FF5'.toColor();
                      initialColorCode.value = '#218FF5';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#218FF5'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#2F1FE4'.toColor();
                      initialColorCode.value = '#2F1FE4';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#2F1FE4'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#C81FE4'.toColor();
                      initialColorCode.value = '#C81FE4';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#C81FE4'.toColor(),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      1.5.h,
                    ),
                    onTap: () {
                      initialColor.value = '#E41FA1'.toColor();
                      initialColorCode.value = '#E41FA1';
                    },
                    child: CircleAvatar(
                      radius: 1.5.h,
                      backgroundColor: '#E41FA1'.toColor(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          getVerSpace(5.h),
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
