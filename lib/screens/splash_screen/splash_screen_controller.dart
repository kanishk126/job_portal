import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../../util/routes/app_routes.dart';

class SplashController extends GetxController {
  var isFirstTime = "";

  @override
  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getString('isLogged')?? 'false';
    Future.delayed(const Duration(seconds: 3), () => switchScreen());
    super.onInit();
  }

  switchScreen() async {
    isFirstTime == 'true'
        ? Get.offNamed(AppRoutes.initial)
        : Get.offNamed(AppRoutes.homeScreen);
  }
}
