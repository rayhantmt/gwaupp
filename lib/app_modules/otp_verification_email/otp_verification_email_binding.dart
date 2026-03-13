import 'package:get/get.dart';
import 'package:gwaupp/app_modules/otp_verification_email/otp_verification_email_controller.dart';

class OtpVerificationEmailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OtpVerificationEmailController>(() => OtpVerificationEmailController(),);
  }
}