import 'package:get/get.dart';
import 'package:gwaupp/app_modules/add_expense/add_expense_controller.dart';

class AddExpenseBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<AddExpenseController>(() => AddExpenseController(),);
  }
}