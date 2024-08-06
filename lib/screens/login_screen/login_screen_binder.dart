import 'package:get/get.dart';
import 'package:job_portal/screens/login_screen/login_screen_controller.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(()=> LoginScreenController());
  }

}