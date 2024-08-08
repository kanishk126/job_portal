import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/util/appColors.dart';
import 'package:job_portal/util/app_constants.dart';
import 'package:job_portal/util/routes/app_pages.dart';
import 'package:job_portal/util/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    runApp(const MyApp());
  } catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase: $e');
    }
    // Handle the error as needed
  }
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
