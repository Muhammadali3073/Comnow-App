import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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


Widget loginSignUpAlreadyButton(whiteText, blueText, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
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
          customWhiteMediumText(text: text, fontSize: 12.px, color: textColor),
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

getCustomTextStyleW4S12({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w400,
    fontFamily: Constant.fontsFamilyRegular,
    fontSize: 12.px,
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
    onTap,
    readOnly,
    suffixIconConstraintsWidth,
    onChanged}) {
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
          borderSide: BorderSide(color: textFormFieldBGColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(24.0.px)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFormFieldBGColor, width: 1.0.px),
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
      fillColor: textFormFieldBGColor,
      hintText: hintText,
      hintStyle: getCustomTextStyleW4S12(
        color: textFormFieldHintColor,
      ),
      enabled: true,
    ),
  );
}
