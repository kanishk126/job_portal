import 'package:get/get.dart';
import 'package:job_portal/screens/home_screen/home_screen_controller.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(()=> HomeScreenController());
  }

}