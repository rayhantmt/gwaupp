import 'package:get/get.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_controller.dart';

class CreateYourProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateYourProfileController>(() => CreateYourProfileController(),);
  }
}