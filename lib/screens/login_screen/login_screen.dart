import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/screens/login_screen/login_screen_controller.dart';
import 'package:job_portal/util/appStyles.dart';
import 'package:job_portal/util/assets.dart';
import 'package:job_portal/util/common_function.dart';
import 'package:job_portal/util/routes/app_routes.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            commonText(
                text: "Happy To See You Again!",
              fontSize: 35,
              fontWeight: FontWeight.w800
            ),
            SizedBox(height: 40,),
            commonText(
              text: 'Email',
              fontSize: 15,
            ),
            const SizedBox(height: 10,),
            commonTextFormField(
                controller: controller.emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              type: 'email',
              emptyErrorText: 'Enter Email Id',
              emailRegExp: RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
              invalidEmailText: "Enter Valid Email Id",
            ),
            const SizedBox(height: 10,),
            commonText(text: 'Password',
                fontSize: 15
            ),
            const SizedBox(height: 10,),
            commonTextFormField(
                controller: controller.emailController,
              hintText: 'Password',
              keyboardType: TextInputType.emailAddress,
              type: 'password',
              emptyErrorText: 'Enter Email Id',
              emailRegExp: RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
              invalidEmailText: "Enter Valid Email Id",
            ),
            const SizedBox(height: 50,),
            commonButton(
                title: 'LogIn',
                isIcon: false,
                onTap: (){
                  Get.offNamed(AppRoutes.homeScreen);
                }
            ),
            const SizedBox(height: 50,),
            commonButton(
                title: 'Continue with Google',
                isIcon: true,
                icon: SvgPicture.asset(Assets.googleIcon,
                  height: 35,
                  width: 35,
                ),
                onTap: (){}
            ),
          ],
        ),
      ),
    );
  }

}