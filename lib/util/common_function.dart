import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/util/appColors.dart';
import 'package:job_portal/util/appStyles.dart';


commonText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  TextOverflow? textOverFlow,
  int? maxLine
}){
  return Text(text,
    textScaleFactor: 1,
    maxLines: maxLine,
    style: Appstyles.textStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      textOverFlow: textOverFlow
    ),
  );
}


commonButton({
  required String title,
  required void Function() onTap,
  Widget? icon,
  required bool isIcon,
  List<BoxShadow>? boxShadow,

}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadow
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          SizedBox(width: isIcon == true ?10 : 0,),
          Text(title,
            style: Appstyles.textStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    ),
  );
}