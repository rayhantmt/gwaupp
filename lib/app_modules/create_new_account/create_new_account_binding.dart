import 'package:get/get.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_controller.dart';

class CreateNewAccountBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<CreateNewAccountController>(() => CreateNewAccountController(),);
  }
}