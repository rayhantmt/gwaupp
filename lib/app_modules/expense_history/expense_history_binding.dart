import 'package:get/get.dart';
import 'package:gwaupp/app_modules/expnese_category/expense_category_controller.dart';

class ExpenseHistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExpenseCategoryController>(() => ExpenseCategoryController(),);
  }
} 