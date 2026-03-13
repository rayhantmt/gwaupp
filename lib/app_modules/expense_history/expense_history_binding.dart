import 'package:get/get.dart';
import 'package:gwaupp/app_modules/expense_history/expense_history_controller.dart';

class ExpenseHistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExpenseHistoryController>(() => ExpenseHistoryController(),);
  }
} 