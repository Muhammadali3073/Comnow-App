import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/constant.dart';
import '../../utils/color_data.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getAssetPng(String image,
    {double? width,
    double? height,
    Color? color,
    double? scale,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetPngPath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: scale,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.svgImagePath + image,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget customWhiteMediumText({
  color,
  text,
  TextAlign? textAlign,
  fontSize,
  fontFamily,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  return Text(
    text.toString(),
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? CustomColors.titleWhiteTextColor,
      fontSize: fontSize,
      fontFamily: fontFamily ?? Constant.fontsFamilyMedium,
      fontWeight: FontWeight.w500,
      decoration: decoration,
      decorationColor: decorationColor,
    ),
  );
}

Widget customBlackMediumText({text, textAlign, fontSize, fontFamily}) {
  return Text(
    text ?? '',
    textAlign: textAlign,
    style: TextStyle(
      color: CustomColors.titleBlackTextColor,
      fontSize: fontSize,
      fontFamily: fontFamily ?? Constant.fontsFamilyMedium,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget gradientButton(text, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(3.2.h),
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.2.h),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.topButtonColor,
              CustomColors.bottomButtonColor,
            ]),
      ),
      child: customWhiteMediumText(
        text: text,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget outlineButton(text, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(3.2.h),
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.2.h),
          border: Border.all(
            color: CustomColors.whiteButtonColor,
          )),
      child: customWhiteMediumText(
        text: text,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget filledBlackButton(text, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(3.2.h),
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      decoration: BoxDecoration(
          color: CustomColors.titleBlackTextColor,
          borderRadius: BorderRadius.circular(3.2.h),
          border: Border.all(
            color: CustomColors.titleBlackTextColor,
          )),
      child: customWhiteMediumText(
        text: text,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget loginSignUpAlreadyButton(whiteText, blueText, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(3.2.h),
    child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: CustomColors.whiteButtonColor,
          borderRadius: BorderRadius.circular(3.2.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customBlackMediumText(
              text: whiteText,
              fontSize: 14.sp,
              fontFamily: Constant.fontsFamilyRegular,
            ),
            getHorSpace(0.5.h),
            customWhiteMediumText(
              text: blueText,
              color: CustomColors.blueTextColor,
              fontSize: 14.sp,
              fontFamily: Constant.fontsFamilyRegular,
            ),
          ],
        )),
  );
}

Widget authButton(text, {Function()? onTap, textColor, backgroundColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(0.8.h),
      ),
      child:
          customWhiteMediumText(text: text, fontSize: 14.sp, color: textColor),
    ),
  );
}

Widget sortButton(text, isSelected, index, {Function()? onTap}) {
  return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          isSelected == index
              ? Container(
                  padding: EdgeInsets.all(0.2.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: CustomColors.blueButtonColor, width: 1.5.px)),
                  child: Container(
                    width: 1.h,
                    height: 1.h,
                    decoration: BoxDecoration(
                        color: CustomColors.blueColor,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: CustomColors.blueButtonColor)),
                  ))
              : Container(
                  padding: EdgeInsets.all(0.2.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColors.tabBarTextColor,
                        width: 1.5.px,
                      )),
                  child: Container(
                    width: 1.0.h,
                    height: 1.0.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.transparent)),
                  )),
          getHorSpace(0.5.h),
          customWhiteMediumText(
            text: text,
            color: isSelected == index
                ? CustomColors.blueButtonColor
                : CustomColors.whiteButtonColor,
            fontSize: 14.sp,
            fontFamily: isSelected == index
                ? Constant.fontsFamilyBold
                : Constant.fontsFamilyRegular,
          ),
        ],
      ));
}

Widget teamMemberMainMemberCard(
  listOfMembers, {
  Function()? onTap,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.h),
    margin: EdgeInsets.only(bottom: 1.4.h),
    decoration: BoxDecoration(
      color: CustomColors.textFormFieldBackgroundColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 2.5.h,
                backgroundColor: listOfMembers.initialBGColor,
                child: customWhiteMediumText(
                    text: listOfMembers.initialName, fontSize: 14.sp),
              ),
              getHorSpace(1.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customWhiteMediumText(
                    text: listOfMembers.firstName,
                    fontSize: 15.sp,
                    fontFamily: Constant.fontsFamilyRegular,
                  ),
                  getVerSpace(0.4.h),
                  customWhiteMediumText(
                    text: listOfMembers.type,
                    color: listOfMembers.type == 'Online'
                        ? CustomColors.greenColor
                        : listOfMembers.type == 'Offline'
                            ? CustomColors.redColor
                            : listOfMembers.type == 'Away'
                                ? CustomColors.yellowColor
                                : CustomColors.titleBlackTextColor,
                    fontSize: 13.sp,
                    fontFamily: Constant.fontsFamilyRegular,
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 0.5.h,
                backgroundColor: listOfMembers.type == 'Online'
                    ? CustomColors.greenColor
                    : listOfMembers.type == 'Offline'
                        ? CustomColors.redColor
                        : listOfMembers.type == 'Away'
                            ? CustomColors.yellowColor
                            : Colors.transparent,
              ),
              getHorSpace(1.5.h),
              getHorSpace(1.5.h),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: CustomColors.activeTabBarColor)),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    size: 2.3.h,
                    color: CustomColors.activeTabBarColor,
                  ),
                ),
              ),
              getHorSpace(0.5.h),
            ],
          )
        ]),
  );
}

Widget groupCard(String? groupName, int? numberOfMembers, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.1.h),
      margin: EdgeInsets.only(
        bottom: 1.4.h,
      ),
      decoration: BoxDecoration(
        color: CustomColors.textFormFieldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customWhiteMediumText(
              text: groupName,
              fontSize: 14.sp,
            ),
            customWhiteMediumText(
                text: numberOfMembers,
                fontSize: 14.sp,
                fontFamily: Constant.fontsFamilyRegular)
          ]),
    ),
  );
}

Widget notificationCard(notificationName, timeOfDelivered, typeMessage,
    {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.2.h),
      margin: EdgeInsets.only(
        bottom: 1.4.h,
      ),
      decoration: BoxDecoration(
        color: CustomColors.textFormFieldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customWhiteMediumText(
                    text: notificationName,
                    fontSize: 14.sp,
                    fontFamily: Constant.fontsFamilyRegular),
                customWhiteMediumText(
                    text: timeOfDelivered,
                    fontSize: 12.sp,
                    fontFamily: Constant.fontsFamilyRegular)
              ]),
          customWhiteMediumText(
            text: typeMessage == 'ping'
                ? 'Ping'
                : typeMessage == 'text'
                    ? 'Message'
                    : 'Voice message',
            fontSize: 14.sp,
          ),
        ],
      ),
    ),
  );
}

Widget messageTemplatesCard(message, currentIndex, RxInt selectedMessage,
    {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Obx(
      () => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.8.h),
        margin: EdgeInsets.only(
          bottom: 1.4.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedMessage == currentIndex
                  ? CustomColors.blueButtonColor
                  : CustomColors.textFormFieldBackgroundColor),
          color: CustomColors.textFormFieldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: customWhiteMediumText(
          textAlign: TextAlign.justify,
          text: message,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}

Widget allMessagesCard(message, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.8.h),
      margin: EdgeInsets.only(
        bottom: 1.4.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.textFormFieldBackgroundColor),
        color: CustomColors.textFormFieldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: customWhiteMediumText(
        textAlign: TextAlign.justify,
        text: message,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget selectTypeCard(text,
    {Function()? onTap, textColor, imageUrl, backgroundColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 2.h),
      decoration: BoxDecoration(
        color: CustomColors.selectUserCardBackgroundColor,
        borderRadius: BorderRadius.circular(2.4.h),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getSvgImage(imageUrl),
          Container(
            alignment: Alignment.center,
            height: 2.5.h,
            width: 11.h,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(0.8.h),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: customWhiteMediumText(
                text: text, fontSize: 9.px, color: textColor),
          ),
        ],
      ),
    ),
  );
}

Widget addMemberTextField(
    {titleText,
    hintText,
    TextEditingController? controller,
    List<TextInputFormatter>? inputFormatters,
    Function(String)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: customWhiteMediumText(
          text: titleText,
          fontFamily: Constant.fontsFamilyRegular,
          fontSize: 14.sp,
        ),
      ),
      getVerSpace(0.5.h),
      getCustomTextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        controller: controller,
        hintText: hintText,
        keyboardType: TextInputType.name,
      ),
    ],
  );
}

getCustomTextStyleW4S12({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w400,
    fontFamily: Constant.fontsFamilyRegular,
    fontSize: 14.sp,
  );
}

Widget getCustomTextFormField(
    {TextEditingController? controller,
    validator,
    hintText,
    suffixIcon,
    obscureText,
    keyboardType,
    prefixIcon,
    Function()? onTap,
    readOnly,
    suffixIconConstraintsWidth,
    List<TextInputFormatter>? inputFormatters,
    Function(String)? onChanged}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    cursorColor: CustomColors.blueButtonColor,
    controller: controller,
    validator: validator,
    onTap: onTap,
    onChanged: onChanged,
    readOnly: readOnly ?? false,
    style: getCustomTextStyleW4S12(
      color: CustomColors.titleWhiteTextColor,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: CustomColors.textFormFieldBackgroundColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(24.0.px)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: CustomColors.textFormFieldBackgroundColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(24.0.px)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.px)),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 2.h),
      suffixIconConstraints: BoxConstraints.tightFor(
          width: suffixIconConstraintsWidth ?? 6.0.h, height: 2.5.h),
      suffixIcon: suffixIcon,
      prefixIconConstraints:
          BoxConstraints.tightForFinite(width: 5.h, height: 2.5.h),
      prefixIcon: prefixIcon,
      isCollapsed: true,
      filled: true,
      fillColor: CustomColors.textFormFieldBackgroundColor,
      hintText: hintText,
      hintStyle: getCustomTextStyleW4S12(
        color: CustomColors.textFormFieldHintColor,
      ),
      enabled: true,
    ),
    inputFormatters: inputFormatters,
  );
}

// Popup Menu Item Design
PopupMenuItem allMemberPopupMenuItem(
    String title, String iconData, int position, int indexLast) {
  return PopupMenuItem(
      padding: EdgeInsets.zero,
      height: 0.h,
      value: position,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 1.5.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: indexLast == 4
              ? Colors.transparent
              : CustomColors.tabBarTextColor,
        ))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSvgImage(iconData, height: 20.px, width: 20.px),
            getHorSpace(0.8.h),
            customWhiteMediumText(
              text: title,
              fontSize: 14.sp,
              fontFamily: Constant.fontsFamilyRegular,
            ),
          ],
        ),
      ));
}

PopupMenuItem groupPopupMenuItem(
    String title, String iconData, int position, int indexLast) {
  return PopupMenuItem(
      padding: EdgeInsets.zero,
      height: 0.h,
      value: position,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 1.5.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: indexLast == 6
              ? Colors.transparent
              : CustomColors.tabBarTextColor,
        ))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSvgImage(iconData, height: 20.px, width: 20.px),
            getHorSpace(0.8.h),
            customWhiteMediumText(
              text: title,
              fontSize: 14.sp,
              fontFamily: Constant.fontsFamilyRegular,
            ),
          ],
        ),
      ));
}

Future<void> sortingDialogBox(BuildContext context, {RxInt? isSelectedSort}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customWhiteMediumText(
                  text: 'Sorting By',
                  fontFamily: Constant.fontsFamilyRegular,
                  fontSize: 16.sp),
              InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: CustomColors.redColor,
                    size: 2.5.h,
                  ))
            ],
          ),
          content: SizedBox(
              height: 12.h,
              child: Column(
                children: [
                  Column(
                    children: [
                      Obx(() => sortButton(
                            "Ascending",
                            isSelectedSort!.value,
                            0,
                            onTap: () {
                              isSelectedSort.value = 0;
                              Get.back();
                            },
                          )),
                      const Divider(
                        color: CustomColors.tabBarTextColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Obx(
                        () => sortButton(
                          "Descending",
                          isSelectedSort!.value,
                          1,
                          onTap: () {
                            isSelectedSort.value = 1;
                            Get.back();
                          },
                        ),
                      ),
                      const Divider(
                        color: CustomColors.tabBarTextColor,
                      )
                    ],
                  ),
                  Obx(
                    () => sortButton(
                      "Custom",
                      isSelectedSort!.value,
                      2,
                      onTap: () {
                        isSelectedSort.value = 2;
                        Get.back();
                      },
                    ),
                  ),
                ],
              )));
    },
  );
}

Future<void> leftMemberDialogBox(BuildContext context, userName,
    {Function()? onRemoveTap, Function()? onScanTap}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customWhiteMediumText(
                  text: '',
                  fontFamily: Constant.fontsFamilyRegular,
                  fontSize: 16.sp),
              InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: CustomColors.redColor,
                    size: 2.5.h,
                  ))
            ],
          ),
          content: SizedBox(
              height: 20.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getSvgImage('logout.svg'),
                  customWhiteMediumText(
                    text:
                        '$userName leave the team if you want to add again\npress the below button scan QR code.',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 14.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'Remove',
                        onTap: onRemoveTap,
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child: filledBlackButton('Scan QR Code',
                              onTap: onScanTap)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> logoutDialogBox(BuildContext context, {Function()? onTap}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          content: SizedBox(
              height: 22.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getSvgImage('logout.svg'),
                  customWhiteMediumText(
                    text:
                        'Do you want to logout?\nIf you logout, your team won\'t be able to contact you anymore.',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 14.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'No',
                        onTap: () => Get.back(),
                      )),
                      getHorSpace(2.h),
                      Expanded(child: filledBlackButton('Yes', onTap: onTap)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> unblockedDialogBox(BuildContext context, userName,
    {Function()? onUnblock}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: getSvgImage('unblock.svg'),
          content: SizedBox(
              height: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customWhiteMediumText(
                    text: 'Do you want to unblock ?\n$userName',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 14.sp,
                  ),
                  getVerSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'Cancel',
                        onTap: () => Get.back(),
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child:
                              filledBlackButton('Unblock', onTap: onUnblock)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> createGroupDialogBox(
  BuildContext context, {
  Function()? onCreate,
  createGroupController,
  String? dialogBoxTitle,
  String? onCreateTitle,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: customWhiteMediumText(
              text: dialogBoxTitle,
              fontFamily: Constant.fontsFamilyRegular,
              fontSize: 16.sp,
              textAlign: TextAlign.center),
          content: SizedBox(
              height: 16.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addMemberTextField(
                    controller: createGroupController,
                    titleText: 'Group Name',
                    hintText: 'Enter Group Name',
                  ),
                  getVerSpace(4.h),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'Cancel',
                        onTap: () => Get.back(),
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child: filledBlackButton(onCreateTitle,
                              onTap: onCreate)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> leaveAppDialogBox(
  BuildContext context, {
  Function()? onCreate,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: getSvgImage('leave_app_warning.svg'),
          content: SizedBox(
              height: 14.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customWhiteMediumText(
                    text:
                        'Do you really want to close the app?\nIf you close the app, you will be shown as "offline"',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 14.sp,
                  ),
                  getVerSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'Cancel',
                        onTap: () => Get.back(),
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child: filledBlackButton('Leave', onTap: onCreate)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> deleteGroupDialogBox(
  BuildContext context, {
  Function()? onCreate,
  String? groupName,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: getSvgImage('delete_group.svg'),
          content: SizedBox(
              height: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customWhiteMediumText(
                    text: 'Do you really want to delete ?\n$groupName',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 14.sp,
                  ),
                  getVerSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'Cancel',
                        onTap: () => Get.back(),
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child: filledBlackButton('Delete', onTap: onCreate)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> timeOutExceptionDialogBox() {
  return Get.defaultDialog(
    backgroundColor: CustomColors.dialogBoxColor,
    titlePadding: EdgeInsets.only(top: 3.h),
    title: 'Oops, Something Went Wrong!',
    titleStyle: TextStyle(
      color: CustomColors.titleWhiteTextColor,
      fontFamily: Constant.fontsFamilyMedium,
      fontSize: 16.sp,
    ),
    content: Column(
      children: [
        customWhiteMediumText(
          text:
              'Don\'t worry - it\'s not your fault. Try to fix your Internet Connection.',
          textAlign: TextAlign.center,
          fontFamily: Constant.fontsFamilyRegular,
          fontSize: 14.sp,
        ),
        getVerSpace(3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: outlineButton(
            'Okay',
            onTap: () => Get.back(),
          ),
        )
      ],
    ),
  );
}

Future<void> loadingDialogBox(
  BuildContext context,
  RxBool canPop,
) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: canPop.value,
        child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            iconPadding: EdgeInsets.zero,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            content: Center(
              child: SizedBox(
                height: 4.5.h,
                width: 4.5.h,
                child: const CircularProgressIndicator(
                  color: CustomColors.hintColor,
                  backgroundColor: CustomColors.dialogBoxColor,
                ),
              ),
            )),
      );
    },
  );
}

Future<void> blockDialogBox(
  BuildContext context, {
  Function()? onCreate,
  String? userName,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: getSvgImage('do_you_want_block.svg'),
          content: SizedBox(
              height: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customWhiteMediumText(
                    text: 'Do you want to block ?\n$userName',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 14.sp,
                  ),
                  getVerSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                          child: outlineButton(
                        'Cancel',
                        onTap: () => Get.back(),
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child: filledBlackButton('Block', onTap: onCreate)),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> pingNotificationDialogBox(
  BuildContext context, {
  Function()? onCreate,
  String? userName,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          content: SizedBox(
              height: 16.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: CustomColors.redColor,
                            size: 2.5.h,
                          )),
                    ],
                  ),
                  customWhiteMediumText(
                    text: '\n$userName needs you',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 16.sp,
                  ),
                  getVerSpace(2.h),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 0.8.h),
                          decoration: BoxDecoration(
                              color: CustomColors.redColor,
                              borderRadius: BorderRadius.circular(3.2.h),
                              border: Border.all(
                                color: CustomColors.titleBlackTextColor,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.close,
                                  color: CustomColors.whiteButtonColor,
                                  size: 2.h),
                              getHorSpace(0.5.h),
                              customWhiteMediumText(
                                text: "Not now",
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      )),
                      getHorSpace(2.h),
                      Expanded(
                          child: GestureDetector(
                        onTap: onCreate,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 0.8.h),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(3.2.h),
                              border: Border.all(
                                color: CustomColors.titleBlackTextColor,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.check,
                                  color: CustomColors.whiteButtonColor,
                                  size: 2.h),
                              getHorSpace(0.5.h),
                              customWhiteMediumText(
                                text: "Coming",
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              )));
    },
  );
}

Future<void> isViewPingNotificationDialogBox(BuildContext context,
    {String? userName, isView}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          content: SizedBox(
              height: 14.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: CustomColors.redColor,
                            size: 2.5.h,
                          )),
                    ],
                  ),
                  customWhiteMediumText(
                    text: '\n$userName needs you',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 16.sp,
                  ),
                  getVerSpace(2.h),
                  isView
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.green, size: 2.h),
                            getHorSpace(0.5.h),
                            customWhiteMediumText(
                              text: "Coming",
                              fontSize: 14.sp,
                              color: Colors.green,
                              fontFamily: Constant.fontsFamilyRegular,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.close,
                                color: CustomColors.redColor, size: 2.h),
                            getHorSpace(0.5.h),
                            customWhiteMediumText(
                              text: "Not now",
                              fontSize: 14.sp,
                              color: CustomColors.redColor,
                              fontFamily: Constant.fontsFamilyRegular,
                            ),
                          ],
                        ),
                ],
              )));
    },
  );
}

Future<void> messageNotificationDialogBox(
  BuildContext context, {
  String? userName,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          content: SizedBox(
              height: 14.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: CustomColors.redColor,
                            size: 2.5.h,
                          )),
                    ],
                  ),
                  customWhiteMediumText(
                    text: '\n$userName message',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 16.sp,
                  ),
                  getVerSpace(2.h),
                  customWhiteMediumText(
                    text: "Come to my office.",
                    fontSize: 14.sp,
                    fontFamily: Constant.fontsFamilyRegular,
                  ),
                ],
              )));
    },
  );
}

Future<void> voiceMessageNotificationDialogBox(
  BuildContext context, {
  String? userName,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: CustomColors.dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          content: SizedBox(
              height: 14.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: CustomColors.redColor,
                            size: 2.5.h,
                          )),
                    ],
                  ),
                  customWhiteMediumText(
                    text: '\n$userName voice message',
                    textAlign: TextAlign.center,
                    fontFamily: Constant.fontsFamilyRegular,
                    fontSize: 16.sp,
                  ),
                  getVerSpace(2.h),
                  getSvgImage('press_to_voice.svg', height: 4.h),
                ],
              )));
    },
  );
}

Future<void> memberCardBottomSheet(
  BuildContext context, {
  Function()? pingOnTap,
  Function()? textMessageOnTap,
  Function()? voiceMessageOnTap,
  Function()? blockOnTap,
  Function()? deleteOnTap,
  Function()? editOnTap,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: CustomColors.dialogBoxColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.px))),
    builder: (BuildContext context) {
      return SizedBox(
        height: 35.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 1.2.h),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          color: CustomColors.redColor,
                          size: 2.5.h,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: pingOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('phone_ring.svg',
                          height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Ping',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: textMessageOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('message.svg', height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Send a message',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: voiceMessageOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('mic.svg', height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Send voice message',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: blockOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('blocked_icon.svg',
                          height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Block',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: deleteOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('delete_icon.svg',
                          height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Delete',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: editOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.transparent,
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('rename_icon.svg',
                          height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Edit',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> teamMemberCardBottomSheet(
  BuildContext context, {
  Function()? pingOnTap,
  Function()? textMessageOnTap,
  Function()? voiceMessageOnTap,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: CustomColors.dialogBoxColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.px))),
    builder: (BuildContext context) {
      return SizedBox(
        height: 20.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 1.2.h),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          color: CustomColors.redColor,
                          size: 2.5.h,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: pingOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('phone_ring.svg',
                          height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Ping',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: textMessageOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CustomColors.tabBarTextColor.withOpacity(0.5),
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('message.svg', height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Send a message',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: voiceMessageOnTap,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.2.h),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.transparent,
                  ))),
                  child: Row(
                    children: [
                      getSvgImage('mic.svg', height: 2.4.h, width: 2.4.h),
                      const Spacer(),
                      customWhiteMediumText(
                        text: 'Send voice message',
                        fontSize: 15.sp,
                        fontFamily: Constant.fontsFamilyRegular,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

customScaffoldMessenger(
  BuildContext context,
  String text,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: Constant.fontsFamilyRegular,
          fontSize: 14.sp,
        ),
      ),
      backgroundColor: CustomColors.toastColor,
      duration: const Duration(seconds: 2),
    ),
  );
}
