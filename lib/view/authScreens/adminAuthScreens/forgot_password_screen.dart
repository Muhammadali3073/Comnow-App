import 'dart:async';
import 'dart:developer';

import 'package:comnow/viewModel/authControllers/admin_forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';
import '../../widgets/widget_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AdminForgotPasswordController adminForgotPasswordController = Get.put(
      AdminForgotPasswordController(),
      tag: 'adminForgotPasswordController');

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  var isBack = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    errorController?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: adminForgotPasswordController.selectedIndex.value == 1
            ? true
            : isBack.value,
        onPopInvoked: (didPop) {
          if (didPop == false &&
              adminForgotPasswordController.selectedIndex.value == 3) {
            Get.back();
          } else if (didPop == false &&
              adminForgotPasswordController.selectedIndex.value == 2) {
            adminForgotPasswordController.selectedIndex.value = 1;
            otpTextController.clear();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.only(top: 11.h, left: 3.2.h, right: 3.2.h),
              decoration:  const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/png/auth_background_image.png'),
                      fit: BoxFit.fitWidth),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [CustomColors.topBackgroundColor, CustomColors.bottomBackgroundColor])),
              child: adminForgotPasswordController.selectedIndex.value == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getSvgImage('forgot_password_image.svg'),
                        getVerSpace(5.4.h),
                        customWhiteMediumText(
                            text: 'Enter your email', fontSize: 20.px),
                        getVerSpace(4.h),
                        getCustomTextFormField(
                          controller: emailTextController,
                          hintText: 'Email',
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                            child: getSvgImage('email_icon.svg'),
                          ),
                        ),
                        getVerSpace(5.6.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                          child: gradientButton(
                            'Next',
                            onTap: () {
                              if (Validations
                                  .handleForgotPasswordEmailScreenError(
                                emailTextController: emailTextController,
                              ).isNotEmpty) {
                                customScaffoldMessenger(
                                  context,
                                  Validations
                                      .handleForgotPasswordEmailScreenError(
                                    emailTextController: emailTextController,
                                  ),
                                );
                              } else {
                                adminForgotPasswordController
                                    .handleEnterEmailInForgotPassword(
                                  context,
                                  email: emailTextController.text.trim(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  : adminForgotPasswordController.selectedIndex.value == 2
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getVerSpace(5.h),
                            getSvgImage('opt_image.svg'),
                            getVerSpace(5.9.h),
                            customWhiteMediumText(
                                text: 'Enter your OTP', fontSize: 20.px),
                            getVerSpace(4.h),
                            PinCodeTextField(
                              autoDisposeControllers: false,
                              autoFocus: false,
                              length: 6,
                              keyboardType: TextInputType.phone,
                              appContext: context,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              cursorHeight: 2.5.h,
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: Constant.fontsFamilyMedium,
                                color: CustomColors.titleWhiteTextColor,
                              ),
                              pinTheme: PinTheme(
                                  borderWidth: 1.px,
                                  shape: PinCodeFieldShape.circle,
                                  selectedColor: CustomColors.textFormFieldBackgroundColor,
                                  selectedFillColor:
                                      CustomColors.textFormFieldBackgroundColor,
                                  inactiveColor: CustomColors.textFormFieldBackgroundColor,
                                  inactiveFillColor:
                                      CustomColors.textFormFieldBackgroundColor,
                                  fieldHeight: 6.h,
                                  fieldWidth: 5.h,
                                  activeColor: CustomColors.textFormFieldBackgroundColor,
                                  activeFillColor: CustomColors.textFormFieldBackgroundColor,
                                  fieldOuterPadding:
                                      EdgeInsets.symmetric(horizontal: 0.6.h)),
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              backgroundColor: Colors.transparent,
                              mainAxisAlignment: MainAxisAlignment.center,
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: otpTextController,
                              onCompleted: (v) {},
                              onChanged: (value) {},
                              beforeTextPaste: (text) {
                                log("Allowing to paste $text");
                                return true;
                              },
                            ),
                            getVerSpace(5.6.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                              child: gradientButton(
                                'Next',
                                onTap: () {
                                  if (Validations
                                      .handleForgotPasswordOTPScreenError(
                                    otpTextController: otpTextController,
                                  ).isNotEmpty) {
                                    customScaffoldMessenger(
                                      context,
                                      Validations
                                          .handleForgotPasswordOTPScreenError(
                                        otpTextController: otpTextController,
                                      ),
                                    );
                                  } else {
                                    adminForgotPasswordController
                                        .handleEnterOTPInForgotPassword(
                                      context,
                                      email: emailTextController.text.trim(),
                                      otp: otpTextController.text.trim(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getVerSpace(2.h),
                            getSvgImage('set_new_password.svg'),
                            getVerSpace(5.9.h),
                            customWhiteMediumText(
                                text: 'Set New Password', fontSize: 20.px),
                            getVerSpace(4.h),
                            getCustomTextFormField(
                              controller: passwordTextController,
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                                child: getSvgImage('password_icon.svg'),
                              ),
                            ),
                            getVerSpace(1.6.h),
                            getCustomTextFormField(
                              controller: confirmPasswordTextController,
                              hintText: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                                child: getSvgImage('password_icon.svg'),
                              ),
                            ),
                            getVerSpace(5.6.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                              child: gradientButton(
                                'Save',
                                onTap: () {
                                  if (Validations
                                      .handleForgotPasswordChangePasswordScreenError(
                                    passwordTextController:
                                        passwordTextController,
                                    confirmPasswordTextController:
                                        confirmPasswordTextController,
                                  ).isNotEmpty) {
                                    customScaffoldMessenger(
                                      context,
                                      Validations
                                          .handleForgotPasswordChangePasswordScreenError(
                                        passwordTextController:
                                            passwordTextController,
                                        confirmPasswordTextController:
                                            confirmPasswordTextController,
                                      ),
                                    );
                                  } else {
                                    adminForgotPasswordController
                                        .handleResetPasswordInForgotPassword(
                                      context,
                                      email: emailTextController.text.trim(),
                                      newPassword: confirmPasswordTextController
                                          .text
                                          .trim(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
