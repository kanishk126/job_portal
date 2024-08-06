import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/util/appColors.dart';

class Appstyles{

static textStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? letterSpacing,
  double? wordSpacing,
  List<Shadow>? shadows,
  TextOverflow ? textOverFlow,
  double? height,
  FontStyle? fontStyle,
}){
  return TextStyle(
    color: color?? AppColors.black,
    fontWeight: fontWeight?? FontWeight.w500,
    fontSize: fontSize ?? 12,
    letterSpacing: letterSpacing?? -0.34,
    wordSpacing: wordSpacing??1,
    shadows: shadows,
    overflow: textOverFlow,
    height: height ?? 1.0,
    fontStyle: fontStyle?? FontStyle.normal,
  );
}


static inputDecoration({
  String? hintText,
  TextStyle? hintStyle,
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  EdgeInsetsGeometry? contentPadding,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool? filled,
  Color? fillColor,
}){
  return InputDecoration(
    hintText: hintText,
    hintStyle: Appstyles.textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight
    ),
    contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 14),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
      borderRadius: BorderRadius.circular(10)
    ),
    errorBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(10)
    ),
    focusedErrorBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(10)
    ),
    enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.circular(10)
    ),
    focusedBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.circular(10)
    ),
    filled: filled ?? false,
    fillColor: fillColor,
  );
}


}