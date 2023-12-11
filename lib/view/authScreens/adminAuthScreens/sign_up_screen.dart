import 'package:comnow/utils/constant.dart';
import 'package:comnow/view/authScreens/adminAuthScreens/login_screen.dart';
import 'package:comnow/view/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isSelected = true.obs;
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.only(
                top: 5.6.h, left: 3.2.h, right: 3.2.h, bottom: 4.h),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/png/auth_background_image.png'),
                    fit: BoxFit.fitWidth),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [topBackgroundColor, bottomBackgroundColor])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getSvgImage('sign_up_image.svg'),
                    getVerSpace(2.h),
                    customWhiteMediumText(
                        text: 'Create New Account', fontSize: 20.px),
                    getVerSpace(4.h),
                    getCustomTextFormField(
                      hintText: 'Full Name',
                      keyboardType: TextInputType.name,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('person_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      hintText: 'Username',
                      keyboardType: TextInputType.name,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('person_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('email_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      hintText: 'Initial',
                      keyboardType: TextInputType.name,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('initial_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('password_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('password_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    Padding(
                      padding: EdgeInsets.only(left: 1.5.h),
                      child: GestureDetector(
                        onTap: () {
                          isSelected.value = !isSelected.value;
                        },
                        child: Row(
                          children: [
                            isSelected.value
                                ? Icon(
                                    Icons.circle_outlined,
                                    color: hintColor,
                                    size: 1.8.h,
                                  )
                                : Icon(
                                    Icons.check_circle_rounded,
                                    color: blueButtonColor,
                                    size: 1.8.h,
                                  ),
                            getHorSpace(0.5.h),
                            customWhiteMediumText(
                              text:
                                  'Do you agreed with our Term & condition and Privacy policy',
                              fontSize: 10.px,
                              fontFamily: Constant.fontsFamilyRegular,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      gradientButton('Create Account'),
                      getVerSpace(1.4.h),
                      loginSignUpAlreadyButton(
                        onTap: () => Get.to(()=>const LoginScreen()),
                          'Already have an account?', 'Login'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
