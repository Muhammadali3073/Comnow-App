import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/authControllers/admin_registration_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../validations/validations.dart';
import '../../widgets/widget_utils.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AdminRegistrationController adminRegistrationController = Get.put(
      AdminRegistrationController(),
      tag: 'adminRegistrationController');

  var isSelectedTermAndCondition = false.obs;
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController initialsTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.only(
                top: 5.6.h, left: 3.2.h, right: 3.2.h, bottom: 4.h),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/png/auth_background_image.png'),
                    fit: BoxFit.fitWidth),
                gradient: Constant.authGradient),
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
                      controller: fullNameTextController,
                      hintText: 'Full Name',
                      keyboardType: TextInputType.name,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('person_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      controller: userNameTextController,
                      hintText: 'Username',
                      keyboardType: TextInputType.name,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                        child: getSvgImage('person_icon.svg'),
                      ),
                    ),
                    getVerSpace(1.6.h),
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
                        controller: initialsTextController,
                        hintText: 'Initials',
                        keyboardType: TextInputType.name,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 1.6.h, right: 0.8.h),
                          child: getSvgImage('initial_icon.svg'),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ]),
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
                    getVerSpace(1.6.h),
                    getCustomTextFormField(
                      controller: confirmPasswordTextController,
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
                          isSelectedTermAndCondition.value =
                              !isSelectedTermAndCondition.value;
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isSelectedTermAndCondition.value
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    color: CustomColors.blueButtonColor,
                                    size: 1.8.h,
                                  )
                                : Icon(
                                    Icons.circle_outlined,
                                    color: CustomColors.hintColor,
                                    size: 1.8.h,
                                  ),
                            getHorSpace(0.5.h),
                            Expanded(
                              child: customWhiteMediumText(
                                text:
                                    'Do you agreed with our Term & Condition and Privacy policy',
                                fontSize: 10.px,
                                fontFamily: Constant.fontsFamilyRegular,
                              ),
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
                      gradientButton(
                        'Create Account',
                        onTap: () {
                          if (Validations.handleSingUpScreenError(
                                  fullNameTextController:
                                      fullNameTextController,
                                  userNameTextController:
                                      userNameTextController,
                                  emailTextController: emailTextController,
                                  initialsTextController:
                                      initialsTextController,
                                  passwordTextController:
                                      passwordTextController,
                                  confirmPasswordTextController:
                                      confirmPasswordTextController,
                                  isSelectedTermAndCondition:
                                      isSelectedTermAndCondition.value)
                              .isNotEmpty) {
                            customScaffoldMessenger(
                                context,
                                Validations.handleSingUpScreenError(
                                    fullNameTextController:
                                        fullNameTextController,
                                    userNameTextController:
                                        userNameTextController,
                                    emailTextController: emailTextController,
                                    initialsTextController:
                                        initialsTextController,
                                    passwordTextController:
                                        passwordTextController,
                                    confirmPasswordTextController:
                                        confirmPasswordTextController,
                                    isSelectedTermAndCondition:
                                        isSelectedTermAndCondition.value));
                          } else {
                            adminRegistrationController.handleAdminRegister(
                              context,
                              fullName: fullNameTextController.text.trim(),
                              userName: userNameTextController.text.trim(),
                              email: emailTextController.text.trim(),
                              initials: initialsTextController.text
                                  .toUpperCase()
                                  .trim(),
                              password: passwordTextController.text.trim(),
                              language: selectedLanguageCode,
                            );
                          }
                        },
                      ),
                      getVerSpace(1.4.h),
                      loginSignUpAlreadyButton(
                          onTap: () => Get.to(() => const LoginScreen()),
                          'Already have an account?',
                          'Login'),
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
