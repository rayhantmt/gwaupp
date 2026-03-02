import 'package:get/get.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<HomeScreenController>(() => HomeScreenController(),);
  }
}