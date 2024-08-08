import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/routes/app_routes.dart';

class SplashController extends GetxController {
  var isFirstTime = "";
  var text = "Job Portal";

  @override
  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getString('isLogged')?? 'false';
    Future.delayed(const Duration(seconds: 3), () => switchScreen());
    super.onInit();
  }

  switchScreen() {
    print('fcchhghg${isFirstTime}');
    isFirstTime == 'false'
        ? Get.offNamed(AppRoutes.logInScreen)
        : Get.offNamed(AppRoutes.homeScreen);
  }
}
