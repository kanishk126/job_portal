import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/util/appColors.dart';
import 'package:job_portal/util/app_constants.dart';
import 'package:job_portal/util/routes/app_pages.dart';
import 'package:job_portal/util/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context , orientation , deviceType ) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        initialRoute: AppRoutes.initial,
        getPages: AppPages.pages,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.white,
        ),
      );
      }
      );
  }
}
