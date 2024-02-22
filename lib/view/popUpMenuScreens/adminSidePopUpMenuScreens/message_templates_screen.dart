import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/profileControllers/profile_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../widgets/widget_utils.dart';

class MessageTemplatesScreen extends StatefulWidget {
  const MessageTemplatesScreen({super.key});

  @override
  State<MessageTemplatesScreen> createState() => _MessageTemplatesScreenState();
}

class _MessageTemplatesScreenState extends State<MessageTemplatesScreen> {
  ProfileController profileController = Get.find(tag: 'profileController');

  var selectedMessage = 999.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Message Templates',
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
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.h,
          ),
          child: Obx(
            () => profileController.loadingGetAdminAddNewMessage.value ||
                    profileController.getTemplateOfMessageModel.value == null
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: Shimmer.fromColors(
                        baseColor: CustomColors.bottomBackgroundColor,
                        highlightColor: Colors.black12,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.only(
                                    top: 3.2.h, left: 2.h, right: 2.h),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 6.h,
                                    margin: EdgeInsets.only(bottom: 1.4.h),
                                    decoration: BoxDecoration(
                                      color: CustomColors
                                          .textFormFieldBackgroundColor,
                                      borderRadius: BorderRadius.circular(
                                        16.0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: profileController
                                .getTemplateOfMessageModel
                                .value!
                                .data!
                                .predefinedMessages!
                                .length,
                            padding: EdgeInsets.only(top: 2.4.h),
                            itemBuilder: (context, index) {
                              return messageTemplatesCard(
                                profileController
                                    .getTemplateOfMessageModel
                                    .value!
                                    .data!
                                    .predefinedMessages![index]
                                    .text
                                    .toString(),
                                index,
                                selectedMessage,
                                onTap: () => selectedMessage.value = index,
                              );
                            },
                          ),
                        ),
                        getVerSpace(1.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                          child: gradientButton(
                            'Send',
                            onTap: () {
                              Get.back();
                              Fluttertoast.showToast(
                                  msg: "Sent message to all successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: CustomColors.toastColor,
                                  textColor: CustomColors.titleWhiteTextColor,
                                  fontSize: 14.sp);
                            },
                          ),
                        ),
                        getVerSpace(3.h),
                      ]),
          ),
        ),
      ),
    );
  }
}
