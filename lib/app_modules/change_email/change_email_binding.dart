import 'package:get/get.dart';
import 'package:gwaupp/app_modules/add_expense/change_email/change_email_controller.dart';

class ChangeEmailBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<ChangeEmailController>(() => ChangeEmailController(),);
  }
}