import 'package:get/get.dart';
import 'package:gwaupp/app_modules/new_expense/new_expense_controller.dart';

class NewExpenseBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut<NewExpenseController>(() => NewExpenseController(),);
  }
}