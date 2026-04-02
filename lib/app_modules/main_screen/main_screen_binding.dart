import 'package:get/get.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';
import 'package:gwaupp/app_modules/insights/insights_controller.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_controller.dart';

class MainScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MainScreenController(),);
   Get.lazyPut<InsightsController>(() => InsightsController(),);
   Get.lazyPut<HomeScreenController>(() => HomeScreenController(),);
  }
}