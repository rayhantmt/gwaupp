import 'package:get/get.dart';
import 'package:gwaupp/app_modules/add_income/add_income_controller.dart';
import 'package:gwaupp/app_modules/select_category_income/select_category_controller.dart';

class SelectCategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCategoryController>(() => SelectCategoryController());
    Get.lazyPut<AddIncomeController>(() => AddIncomeController());
  }
}
