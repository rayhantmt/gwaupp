import 'package:get/get.dart';
import 'package:gwaupp/app_modules/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),);
  }
}