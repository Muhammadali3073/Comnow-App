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

Widget customWhiteMediumText({color, text, textAlign, fontSize, fontFamily}) {
  return Text(
    text ?? '',
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? titleWhiteTextColor,
      fontSize: fontSize,
      fontFamily: fontFamily ?? Constant.fontsFamilyMedium,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget customBlackMediumText({text, textAlign, fontSize, fontFamily}) {
  return Text(
    text ?? '',
    textAlign: textAlign,
    style: TextStyle(
      color: titleBlackTextColor,
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
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              topButtonColor,
              bottomButtonColor,
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
            color: whiteButtonColor,
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
          color: titleBlackTextColor,
          borderRadius: BorderRadius.circular(3.2.h),
          border: Border.all(
            color: titleBlackTextColor,
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
          color: whiteButtonColor,
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
              color: blueTextColor,
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
                  padding: EdgeInsets.all(0.01.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: blueButtonColor)),
                  child: Icon(
                    Icons.circle_rounded,
                    color: blueButtonColor,
                    size: 1.5.h,
                  ),
                )
              : Icon(
                  Icons.circle_outlined,
                  color: hintColor,
                  size: 1.8.h,
                ),
          getHorSpace(0.5.h),
          customWhiteMediumText(
            text: text,
            color: isSelected == index ? blueButtonColor : whiteButtonColor,
            fontSize: 14.sp,
            fontFamily: isSelected == index
                ? Constant.fontsFamilyBold
                : Constant.fontsFamilyRegular,
          ),
        ],
      ));
}

Widget mainMemberCard(listOfMembers, {Function()? onTap}) {
  return InkWell(
    onLongPress: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.h),
      margin: EdgeInsets.only(bottom: 1.4.h),
      decoration: BoxDecoration(
        color: listOfMembers.type == 'Left team' &&
                listOfMembers.isBlocked == false
            ? leftMemberBGCardColor
            : textFormFieldBackgroundColor,
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
                  backgroundColor: listOfMembers.type == 'Left team' &&
                          listOfMembers.isBlocked == false
                      ? leftMemberBGColor
                      : listOfMembers.initialBGColor,
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
                    listOfMembers.isBlocked == true
                        ? Container()
                        : customWhiteMediumText(
                            text: listOfMembers.type,
                            color: listOfMembers.type == 'Online'
                                ? greenColor
                                : listOfMembers.type == 'Offline'
                                    ? redColor
                                    : listOfMembers.type == 'Away'
                                        ? yellowColor
                                        : titleBlackTextColor,
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
                listOfMembers.isBlocked == true
                    ? Container()
                    : CircleAvatar(
                        radius: 0.5.h,
                        backgroundColor: listOfMembers.type == 'Online'
                            ? greenColor
                            : listOfMembers.type == 'Offline'
                                ? redColor
                                : listOfMembers.type == 'Away'
                                    ? yellowColor
                                    : Colors.transparent,
                      ),
                getHorSpace(1.5.h),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: activeTabBarColor)),
                  child: Icon(Icons.more_horiz_outlined,
                      size: 2.3.h, color: activeTabBarColor),
                ),
                getHorSpace(0.5.h),
              ],
            )
          ]),
    ),
  );
}

Widget groupCard(groupName, numberOfMembers, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.1.h),
      margin: EdgeInsets.only(
        bottom: 1.4.h,
      ),
      decoration: BoxDecoration(
        color: textFormFieldBackgroundColor,
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

Widget selectTypeCard(text,
    {Function()? onTap, textColor, imageUrl, backgroundColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 2.h),
      decoration: BoxDecoration(
        color: selectUserCardBackgroundColor,
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
    controller,
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
    {controller,
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
    cursorColor: blueButtonColor,
    controller: controller,
    validator: validator,
    onTap: onTap,
    onChanged: onChanged,
    readOnly: readOnly ?? false,
    style: getCustomTextStyleW4S12(
      color: titleWhiteTextColor,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: textFormFieldBackgroundColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(24.0.px)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: textFormFieldBackgroundColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(24.0.px)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.px)),
      contentPadding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 2.h),
      suffixIconConstraints: BoxConstraints.tightFor(
          width: suffixIconConstraintsWidth ?? 6.0.h, height: 2.5.h),
      suffixIcon: suffixIcon,
      prefixIconConstraints:
          BoxConstraints.tightForFinite(width: 5.h, height: 2.5.h),
      prefixIcon: prefixIcon,
      isCollapsed: true,
      filled: true,
      fillColor: textFormFieldBackgroundColor,
      hintText: hintText,
      hintStyle: getCustomTextStyleW4S12(
        color: textFormFieldHintColor,
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
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.4.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: indexLast == 4 ? Colors.transparent : tabBarTextColor,
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
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.4.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: indexLast == 6 ? Colors.transparent : tabBarTextColor,
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

Future<void> sortingDialogBox(BuildContext context, dataFile,
    {RxInt? isSelectedSort}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: dialogBoxColor,
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
                    color: redColor,
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
                            dataFile.sortModel[0].name.toString(),
                            isSelectedSort!.value,
                            0,
                            onTap: () {
                              isSelectedSort.value = 0;
                              Get.back();
                            },
                          )),
                      Divider(
                        color: tabBarTextColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Obx(
                        () => sortButton(
                          dataFile.sortModel[1].name.toString(),
                          isSelectedSort!.value,
                          1,
                          onTap: () {
                            isSelectedSort.value = 1;
                            Get.back();
                          },
                        ),
                      ),
                      Divider(
                        color: tabBarTextColor,
                      )
                    ],
                  ),
                  Obx(
                    () => sortButton(
                      dataFile.sortModel[2].name.toString(),
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

Future<void> createGroupDialogBox(
  BuildContext context, {
  Function()? onCreate,
  createGroupController,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: customWhiteMediumText(
              text: 'Create Group',
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
                    titleText: 'Team Name',
                    hintText: 'Group Name',
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
                          child: filledBlackButton('Create', onTap: onCreate)),
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
          backgroundColor: dialogBoxColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px)),
          title: getSvgImage('leave_app_warning.svg'),
          content: SizedBox(
              height: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
