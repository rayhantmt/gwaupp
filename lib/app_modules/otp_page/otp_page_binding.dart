import 'package:get/get.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_controller.dart';

class OtpPageBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<OtpPageController>(() => OtpPageController(),);
  }
}