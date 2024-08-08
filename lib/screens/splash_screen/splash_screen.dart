import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/screens/splash_screen/splash_screen_controller.dart';
import 'package:job_portal/util/appStyles.dart';

import '../../util/appColors.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Job Portal",
            textScaleFactor: 1.0,
            style: Appstyles.textStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
            ),
          ),
        ]
      )
    );
  }
}
