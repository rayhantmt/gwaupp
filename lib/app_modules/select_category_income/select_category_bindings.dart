import 'package:get/get.dart';
import 'package:gwaupp/app_modules/select_category_income/select_category_controller.dart';

class SelectCategoryBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<SelectCategoryController>(() => SelectCategoryController(),);
  }
}