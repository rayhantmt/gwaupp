import 'package:get/get.dart';
import 'package:gwaupp/app_modules/change_password/change_password_controller.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ChangePasswordController>(() => ChangePasswordController(),);
  }
}