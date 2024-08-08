import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/screens/login_screen/login_screen_controller.dart';
import 'package:job_portal/util/appStyles.dart';
import 'package:job_portal/util/assets.dart';
import 'package:job_portal/util/auth_services.dart';
import 'package:job_portal/util/common_function.dart';
import '../../util/appColors.dart';

class LoginScreen extends GetView<LoginScreenController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Text('LogIn Screen',
          style: Appstyles.textStyle(
            fontSize: 25,
            color: AppColors.white,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: commonButton(
                title: 'Continue with Google',
                isIcon: true,
                icon: SvgPicture.asset(Assets.googleIcon,
                  height: 35,
                  width: 35,
                ),
                onTap: (){
                  AuthServices().signInWithGoogle();
                }
                ),
          )
      ),
    );
  }

}