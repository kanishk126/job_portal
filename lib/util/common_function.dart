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



commonTextFormField({
  Key? key,
  required TextEditingController controller,
  FocusNode? focusNode,
  TextInputType? keyboardType,
  TextCapitalization? textCapitalization,
  String ? emptyErrorText,
  String ? invalidEmailText,
  String ? invalidPasswordText,
  String ? type,
  Widget? suffixIcon,
  bool? readOnly,
  String? obscuringCharacter,
  bool? obscureText,
  int? maxLength,
  void Function(String)? onChanged,
  void Function()? onTap,
  void Function(PointerDownEvent)? onTapOutside,
  void Function(String)? onFieldSubmitted,
  void Function(String?)? onSaved,
  String? hintText,
  emailRegExp,
  passwordRegExp,
}){
  return TextFormField(
    key: key,
    controller: controller,
    readOnly: readOnly ?? false,
    obscuringCharacter: obscuringCharacter ?? '.',
    obscureText: obscureText ?? false,
    maxLength: maxLength,
    decoration: Appstyles.inputDecoration(
      hintText: hintText,
      fontSize: 15,
      color: AppColors.gray,
      suffixIcon: suffixIcon
    ),
    focusNode: focusNode,
    keyboardType: keyboardType ?? TextInputType.text,
    textCapitalization: textCapitalization ?? TextCapitalization.none,
    validator: (value){
      if(value!.isEmpty){
        return emptyErrorText;
      }else if(type == 'email'){
        final emailRegexp= emailRegExp;
        if(!emailRegexp.hasMatch(value.toString())){
          return invalidEmailText;
        }else{
          return null;
        }
      }else if(type == 'password'){
        final passwordRegexp = passwordRegExp;
        if(value.length <8){
          return 'Password At Least 8 Character';
        }else if(!passwordRegexp.hasMatch(value.toString())){
          return invalidPasswordText;
        }else{
          return null;
        }
      }return null;
    },
    onTap: onTap,
    onSaved: onSaved,
    onTapOutside: onTapOutside,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
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