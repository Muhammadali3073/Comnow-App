import 'dart:developer';

import 'package:comnow/utils/data.dart';
import 'package:comnow/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controller/groupController/get_groups_controller.dart';
import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../../validations/validations.dart';
import '../../../widgets/widget_utils.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key, required this.routeName, this.groupId});

  final String routeName;
  final String? groupId;

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {

  GetGroupsController getGroupsController =
      Get.find(tag: 'getGroupsController');

  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController initialsTextController = TextEditingController();

  var initialsString = ''.obs;
  var currentToken = ''.obs;
  var initialColorCode = ''.obs;
  String? selectedLanguageCode;
  dynamic initialColor = CustomColors.topButtonColor.obs;
  DataFile dataFile = DataFile();

  getTokenAndLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    currentToken.value = sharedPreferences.getString('token') ?? '';
    log(currentToken.toString());

    // Get App Language in SharedPreferences
    selectedLanguageCode =
        sharedPreferences.getString('selectedLanguageCode') ?? 'en';
    log('App Language: $selectedLanguageCode');
  }

  @override
  void initState() {
    getTokenAndLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.titleBlackTextColor,
          centerTitle: true,
          title: customWhiteMediumText(
              text: 'Add Member',
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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding:
                EdgeInsets.only(top: 4.h, bottom: 16.h, left: 4.h, right: 4.h),
            decoration: const BoxDecoration(gradient: Constant.appGradient),
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
                        controller: firstNameTextController,
                        titleText: 'First name',
                        hintText: 'Enter first name',
                      ),
                      getVerSpace(1.6.h),
                      addMemberTextField(
                        controller: lastNameTextController,
                        titleText: 'Last name',
                        hintText: 'Enter last name',
                      ),
                      getVerSpace(1.6.h),
                      addMemberTextField(
                          controller: initialsTextController,
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.h),
                    child: gradientButton(
                      'Next',
                      onTap: () {
                        if (Validations.handleAddMemberScreenError(
                          firstNameTextController: firstNameTextController,
                          lastNameTextController: lastNameTextController,
                          initialsTextController: initialsTextController,
                          selectedColor: initialColor.value,
                        ).isNotEmpty) {
                          customScaffoldMessenger(
                              context,
                              Validations.handleAddMemberScreenError(
                                firstNameTextController:
                                    firstNameTextController,
                                lastNameTextController: lastNameTextController,
                                initialsTextController: initialsTextController,
                                selectedColor: initialColor.value,
                              ));
                        } else {
                          if(widget.routeName == 'team'){
                            getGroupsController.handleAddMemberInTeam(
                              context,
                              token: currentToken.value,
                              firstName:
                              firstNameTextController.text.trim(),
                              lastName: lastNameTextController.text.trim(),
                              initials: initialsTextController.text.trim(),
                              color: initialColorCode.value,
                              language: selectedLanguageCode,
                            );
                          }else if(widget.routeName == 'group'){
                            getGroupsController.handleAddMemberInGroup(
                              context,
                              token: currentToken.value,
                              groupId: widget.groupId,
                              firstName:
                              firstNameTextController.text.trim(),
                              lastName: lastNameTextController.text.trim(),
                              initials: initialsTextController.text.trim(),
                              color: initialColorCode.value,
                              language: selectedLanguageCode,
                            );
                          }

                        }
                      },
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
