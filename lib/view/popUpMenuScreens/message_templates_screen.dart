import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../widgets/widget_utils.dart';

class MessageTemplatesScreen extends StatefulWidget {
  const MessageTemplatesScreen({super.key});

  @override
  State<MessageTemplatesScreen> createState() => _MessageTemplatesScreenState();
}

class _MessageTemplatesScreenState extends State<MessageTemplatesScreen> {
  DataFile dataFile = DataFile();
  var selectedMessage = 100000001.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Message Templates',
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: whiteButtonColor,
              size: 2.h,
            )),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          topBackgroundColor,
          bottomBackgroundColor,          bottomBackgroundColor,

              topBackgroundColor,
        ])),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.h,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dataFile.messageTemplatesModel.length,
                padding: EdgeInsets.only(top: 2.4.h),
                itemBuilder: (context, index) {
                  return messageTemplatesCard(
                    dataFile.messageTemplatesModel[index].message.toString(),
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
                      backgroundColor: toastColor,
                      textColor: titleWhiteTextColor,
                      fontSize: 14.sp);
                },
              ),
            ),
            getVerSpace(3.h),
          ]),
        ),
      ),
    );
  }
}
