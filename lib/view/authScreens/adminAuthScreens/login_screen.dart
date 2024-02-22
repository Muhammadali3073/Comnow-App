import 'dart:developer';

import 'package:comnow/view/authScreens/adminAuthScreens/forgot_password_screen.dart';
import 'package:comnow/view/authScreens/adminAuthScreens/sign_up_screen.dart';
import 'package:comnow/view/authScreens/teamMemberAuthScreens/login_with_qr_screen.dart';
import 'package:comnow/view/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/authControllers/admin_login_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AdminLoginController adminLoginController =
      Get.put(AdminLoginController(), tag: 'adminLoginController');

  var changeColor = true.obs;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  String? selectedLanguageCode;

  sharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get App Language in SharedPreferences
    selectedLanguageCode =
        sharedPreferences.getString('selectedLanguageCode') ?? 'en';

    log('App Language: $selectedLanguageCode');
  }

  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: CustomColors.bottomBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.only(
                top: 7.h, left: 3.2.h, right: 3.2.h, bottom: 4.h),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/png/auth_background_image.png'),
                    fit: BoxFit.fitWidth),
                gradient: Constants.authGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      controller: emailTextController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('email_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      controller: passwordTextController,
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
                                  ? CustomColors.titleWhiteTextColor
                                  : CustomColors.blueTextColor,
                              fontSize: 12.px,
                              fontFamily: Constants.fontsFamilyRegular),
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
                        onTap: () {
                          if (Validations.handleLoginScreenError(
                            emailTextController: emailTextController,
                            passwordTextController: passwordTextController,
                          ).isNotEmpty) {
                            customScaffoldMessenger(
                                context,
                                Validations.handleLoginScreenError(
                                  emailTextController: emailTextController,
                                  passwordTextController:
                                      passwordTextController,
                                ));
                          } else {
                            adminLoginController.handleAdminLogin(
                              context,
                              email: emailTextController.text.trim(),
                              password: passwordTextController.text.trim(),
                              language: selectedLanguageCode,
                            );
                          }
                        },
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
