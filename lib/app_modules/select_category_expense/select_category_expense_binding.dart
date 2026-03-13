import 'package:get/get.dart';
import 'package:gwaupp/app_modules/select_category_expense/select_category_expense_controller.dart';

class SelectCategoryExpenseBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<SelectCategoryExpenseController>(() => SelectCategoryExpenseController(),);
  }
}