import 'package:comnow/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../widgets/widget_utils.dart';

class AdminNotificationScreen extends StatefulWidget {
  const AdminNotificationScreen({super.key});

  @override
  State<AdminNotificationScreen> createState() => _AdminNotificationScreenState();
}

class _AdminNotificationScreenState extends State<AdminNotificationScreen> {
  DataFile dataFile = DataFile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Notification',
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(horizontal: 2.4.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              CustomColors.topBackgroundColor,
              CustomColors.bottomBackgroundColor,          CustomColors.bottomBackgroundColor,

              CustomColors.topBackgroundColor,
        ])),
        child: ListView.builder(
          itemCount: dataFile.notificationModelList.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          itemBuilder: (context, outerIndex) {
            return Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customWhiteMediumText(
                    text: dataFile
                        .notificationModelList[outerIndex].dateOfDelivered
                        .toString(),
                    fontSize: 12.sp,
                  ),
                  getHorSpace(0.8.h),
                  Expanded(
                    child: Container(
                      height: 0.1.h,
                      color: CustomColors.whiteButtonColor,
                    ),
                  ),
                ],
              ),
              getVerSpace(1.5.h),
              ListView.builder(
                itemCount: dataFile.notificationModelList[outerIndex]
                    .notificationModel!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, innerIndex) {
                  return notificationCard(
                    onTap: () {
                      dataFile.notificationModelList[outerIndex]
                                  .notificationModel![innerIndex].type
                                  .toString() ==
                              'ping'
                          ? dataFile.notificationModelList[outerIndex]
                                      .notificationModel![innerIndex].isView ==
                                  false
                              ? pingNotificationDialogBox(
                                  context,
                                  userName: dataFile
                                      .notificationModelList[outerIndex]
                                      .notificationModel![innerIndex]
                                      .firstName
                                      .toString(),
                                  onCreate: () {
                                    Get.back();
                                  },
                                )
                              : isViewPingNotificationDialogBox(context,
                                  userName: dataFile
                                      .notificationModelList[outerIndex]
                                      .notificationModel![innerIndex]
                                      .firstName
                                      .toString(),
                                  isView: dataFile
                                      .notificationModelList[outerIndex]
                                      .notificationModel![innerIndex]
                                      .isView)
                          : dataFile.notificationModelList[outerIndex]
                                      .notificationModel![innerIndex].type
                                      .toString() ==
                                  'text'
                              ? messageNotificationDialogBox(
                                  context,
                                  userName: dataFile
                                      .notificationModelList[outerIndex]
                                      .notificationModel![innerIndex]
                                      .firstName
                                      .toString(),
                                )
                              : voiceMessageNotificationDialogBox(
                                  context,
                                  userName: dataFile
                                      .notificationModelList[outerIndex]
                                      .notificationModel![innerIndex]
                                      .firstName
                                      .toString(),
                                );
                    },
                    dataFile.notificationModelList[outerIndex]
                        .notificationModel![innerIndex].firstName
                        .toString(),
                    dataFile.notificationModelList[outerIndex]
                        .notificationModel![innerIndex].timeOfDelivered
                        .toString(),
                    dataFile.notificationModelList[outerIndex]
                        .notificationModel![innerIndex].type
                        .toString(),
                  );
                },
              ),
              getVerSpace(1.h),
            ]);
          },
        ),
      ),
    );
  }
}
