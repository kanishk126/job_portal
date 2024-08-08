import 'package:get/get.dart';
import 'package:job_portal/screens/splash_screen/splash_screen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}