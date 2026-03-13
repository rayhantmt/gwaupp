import 'package:get/get.dart';
import 'package:gwaupp/app_modules/personal_details/personal_details_controller.dart';

class PersonalDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PersonalDetailsController>(() => PersonalDetailsController(),);
  }
}