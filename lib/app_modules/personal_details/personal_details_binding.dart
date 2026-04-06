import 'package:get/get.dart';
import 'package:gwaupp/app_modules/personal_details/personal_details_controller.dart';
import 'package:gwaupp/global_services/global_services.dart';

class PersonalDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PersonalDetailsController>(() => PersonalDetailsController(),);
    Get.lazyPut<GlobalServicesController>(() => GlobalServicesController(),);
  }
}