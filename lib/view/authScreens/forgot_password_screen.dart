import 'dart:async';
import 'dart:developer';

import 'package:comnow/utils/constant.dart';
import 'package:comnow/view/authScreens/login_screen.dart';
import 'package:comnow/view/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  var selectedIndex = 1.obs;
  var isBack = false.obs;

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
        canPop: isBack.value,
        onPopInvoked: (didPop) {
          if (didPop == false && selectedIndex.value == 3) {
            selectedIndex.value = 2;
          } else if (didPop == false && selectedIndex.value == 2) {
            selectedIndex.value = 1;
            isBack.value = true;
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.only(top: 11.h, left: 3.2.h, right: 3.2.h),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/png/auth_background_image.png'),
                      fit: BoxFit.fitWidth),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [topBackgroundColor, bottomBackgroundColor])),
              child: selectedIndex.value == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getSvgImage('forgot_password_image.svg'),
                        getVerSpace(5.4.h),
                        customWhiteMediumText(
                            text: 'Enter your email', fontSize: 20.px),
                        getVerSpace(4.h),
                        getCustomTextFormField(
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
                              selectedIndex.value = 2;
                            },
                          ),
                        ),
                      ],
                    )
                  : selectedIndex.value == 2
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
                              length: 4,
                              keyboardType: TextInputType.phone,
                              appContext: context,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              cursorHeight: 2.5.h,
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: Constant.fontsFamilyMedium,
                                color: titleWhiteTextColor,
                              ),
                              pinTheme: PinTheme(
                                  borderWidth: 1.px,
                                  shape: PinCodeFieldShape.circle,
                                  selectedColor: textFormFieldBackgroundColor,
                                  selectedFillColor:
                                      textFormFieldBackgroundColor,
                                  inactiveColor: textFormFieldBackgroundColor,
                                  inactiveFillColor:
                                      textFormFieldBackgroundColor,
                                  fieldHeight: 6.h,
                                  fieldWidth: 5.h,
                                  activeColor: textFormFieldBackgroundColor,
                                  activeFillColor: textFormFieldBackgroundColor,
                                  fieldOuterPadding:
                                      EdgeInsets.symmetric(horizontal: 2.1.h)),
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              backgroundColor: Colors.transparent,
                              mainAxisAlignment: MainAxisAlignment.center,
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: otpController,
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
                                  selectedIndex.value = 3;
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
                                onTap: () => Get.to(() => const LoginScreen()),
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
