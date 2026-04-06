import 'package:get/get.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';
import 'package:gwaupp/global_services/global_services.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<GlobalServicesController>(() => GlobalServicesController());
  }
}
