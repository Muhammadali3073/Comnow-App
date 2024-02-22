import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/profileControllers/profile_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';
import '../../widgets/widget_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ProfileController profileController = Get.find(tag: 'profileController');
  TextEditingController currentPasswordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Change Password',
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
        padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 5.6.h),
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: Column(children: [
          addMemberTextField(
            keyboardType: TextInputType.visiblePassword,
            controller: currentPasswordTextController,
            titleText: 'Current Password',
            hintText: 'Enter current password',
          ),
          getVerSpace(1.6.h),
          addMemberTextField(
            keyboardType: TextInputType.visiblePassword,
            controller: newPasswordTextController,
            titleText: 'New Password',
            hintText: 'Enter new password',
          ),
          getVerSpace(1.6.h),
          addMemberTextField(
            keyboardType: TextInputType.visiblePassword,
            controller: confirmPasswordTextController,
            titleText: 'Confirm Password',
            hintText: 'Enter confirm password',
          ),
          getVerSpace(5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: gradientButton(
              'Update',
              onTap: () {
                if (Validations.handleChangePasswordScreenError(
                  currentPasswordTextController: currentPasswordTextController,
                  newPasswordTextController: newPasswordTextController,
                  confirmPasswordTextController: confirmPasswordTextController,
                ).isNotEmpty) {
                  customScaffoldMessenger(
                      context,
                      Validations.handleChangePasswordScreenError(
                        currentPasswordTextController:
                            currentPasswordTextController,
                        newPasswordTextController: newPasswordTextController,
                        confirmPasswordTextController:
                            confirmPasswordTextController,
                      ));
                } else {
                  profileController.handleAdminChangePassword(
                    context,
                    token: Constants.tokenOfDoctor.value,
                    language: Constants.codeOfLanguage.value,
                    currentPassword: currentPasswordTextController.text,
                    newPassword: newPasswordTextController.text,
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
