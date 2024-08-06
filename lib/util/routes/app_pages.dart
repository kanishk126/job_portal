import 'package:get/get.dart';
import 'package:job_portal/screens/home_screen/home_screen.dart';
import 'package:job_portal/screens/home_screen/home_screen_binder.dart';
import 'package:job_portal/screens/login_screen/login_screen.dart';
import 'package:job_portal/screens/login_screen/login_screen_binder.dart';
import 'package:job_portal/util/routes/app_routes.dart';

class AppPages{

  static final pages =[

    GetPage(
        name: AppRoutes.initial,
        page: ()=> LoginScreen(),
        binding: LoginScreenBinding()
    ),
    GetPage(
        name: AppRoutes.homeScreen,
        page: ()=> HomeScreen(),
        binding: HomeScreenBinding()
    )
  ];
}