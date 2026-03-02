import 'package:get/get.dart';
import 'package:gwaupp/app_modules/verify_otp_forgotpass/verify_otp_forgotpass_controller.dart';

class VerifyOtpForgotpassBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpForgotpassController>(() => VerifyOtpForgotpassController(),);
  }
}