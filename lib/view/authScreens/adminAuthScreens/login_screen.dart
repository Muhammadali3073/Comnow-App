import 'package:comnow/view/authScreens/adminAuthScreens/forgot_password_screen.dart';
import 'package:comnow/view/authScreens/adminAuthScreens/sign_up_screen.dart';
import 'package:comnow/view/authScreens/teamMemberAuthScreens/login_with_qr_screen.dart';
import 'package:comnow/view/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../navBarScreen/admin_nav_bar_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var changeColor = true.obs;
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.only(
                top: 11.h, left: 3.2.h, right: 3.2.h, bottom: 6.7.h),
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
                    getSvgImage('login_image.svg'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customWhiteMediumText(
                        text: 'Login Account', fontSize: 20.px),
                    getVerSpace(4.h),
                    getCustomTextFormField(
                      hintText: 'Email',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('email_icon.svg'),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.h, vertical: 0.8.h),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            if (changeColor.value = true) {
                              changeColor.value = false;
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () => changeColor.value = true,
                              );
                              Get.to(() => const ForgotPasswordScreen());
                            }
                          },
                          child: customWhiteMediumText(
                              text: 'Forget password',
                              color: changeColor.value
                                  ? titleWhiteTextColor
                                  : blueTextColor,
                              fontSize: 12.px,
                              fontFamily: Constant.fontsFamilyRegular),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                      child: gradientButton(
                        'Login',
                        onTap: () => Get.offAll(
                            () => const AdminBottomNavigationBarScreen()),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                      child: gradientButton(
                        'Login With QR Code',
                        onTap: () => Get.to(() => const LoginWithQRScreen()),
                      ),
                    ),
                    getVerSpace(2.4.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.0.h),
                      child: loginSignUpAlreadyButton(
                          onTap: () => Get.to(() => const SignUpScreen()),
                          'Don\'t  have an account?',
                          'Sign up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
