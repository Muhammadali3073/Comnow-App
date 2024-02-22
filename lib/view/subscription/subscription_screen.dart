import 'package:comnow/controller/subscriptionController/subscription_controller.dart';
import 'package:comnow/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../widgets/widget_utils.dart';

class SubscriptionPackageScreen extends StatefulWidget {
  const SubscriptionPackageScreen({super.key});

  @override
  State<SubscriptionPackageScreen> createState() =>
      _SubscriptionPackageScreenState();
}

class _SubscriptionPackageScreenState extends State<SubscriptionPackageScreen> {
  SubscriptionController subscriptionController =
      Get.put(SubscriptionController(), tag: 'subscriptionController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bottomBackgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Subscriptions',
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
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.1.h),
                margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.1.h),
                decoration: BoxDecoration(
                  color: CustomColors.textFormFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customWhiteMediumText(
                        text: DataFile.subscriptionPackagesModel[0].name
                            .toString(),
                        fontSize: 14.sp,
                      ),
                      customWhiteMediumText(
                          text: DataFile.subscriptionPackagesModel[0].duration
                              .toString(),
                          fontSize: 14.sp,
                          fontFamily: Constants.fontsFamilyRegular)
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.h),
                child: gradientButton(
                  'Subscribe',
                  onTap: () {
                    subscriptionController.handleSubscription(
                      context,
                      token: Constants.tokenOfDoctor.value,
                      isSubscribed: true,
                      code: 'DoctorSubscriptionTest',
                      expiry: '2024-12-31',
                      language: Constants.codeOfLanguage.value,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
