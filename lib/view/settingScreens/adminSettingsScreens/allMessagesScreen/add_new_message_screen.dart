import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/data.dart';
import '../../../widgets/widget_utils.dart';

class AddNewMessagesScreen extends StatefulWidget {
  const AddNewMessagesScreen({super.key});

  @override
  State<AddNewMessagesScreen> createState() => _AddNewMessagesScreenState();
}

class _AddNewMessagesScreenState extends State<AddNewMessagesScreen> {
  TextEditingController messageTextEditController = TextEditingController();
  DataFile dataFile = DataFile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'Add New Message',
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
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            gradient: Constant.appGradient),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            customWhiteMediumText(
              text: 'Create new message template',
              fontSize: 15.sp,
              fontFamily: Constant.fontsFamilyRegular,
            ),
            getVerSpace(3.2.h),
            TextFormField(
              controller: messageTextEditController,
              keyboardType: TextInputType.text,
              cursorColor: CustomColors.blueButtonColor,
              style: getCustomTextStyleW4S12(
                color: CustomColors.titleWhiteTextColor,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColors.textFormFieldBackgroundColor, width: 1.0.px),
                    borderRadius: BorderRadius.circular(16.0.px)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColors.textFormFieldBackgroundColor, width: 1.0.px),
                    borderRadius: BorderRadius.circular(16.0.px)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.px)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 2.h),
                prefixIconConstraints:
                    BoxConstraints.tightForFinite(width: 5.h, height: 2.5.h),
                isCollapsed: true,
                filled: true,
                fillColor: CustomColors.textFormFieldBackgroundColor,
                hintText: 'Enter new message ...',
                hintStyle: getCustomTextStyleW4S12(
                  color: CustomColors.textFormFieldHintColor,
                ),
                enabled: true,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(150),
              ],
              maxLength: 150,
              maxLines: 4,
            ),
            getVerSpace(3.2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: gradientButton(
                'Add Template',
                onTap: () {
                  if (messageTextEditController.text.isNotEmpty) {
                    Get.back();
                    Fluttertoast.showToast(
                        msg: "Add template successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: CustomColors.toastColor,
                        textColor: CustomColors.titleWhiteTextColor,
                        fontSize: 14.sp);
                    messageTextEditController.clear();
                  } else {
                    customScaffoldMessenger(context, 'Message do not empty.');
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
