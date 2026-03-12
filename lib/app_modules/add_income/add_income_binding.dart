import 'package:get/get.dart';
import 'package:gwaupp/app_modules/add_income/add_income_controller.dart';

class AddIncomeBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<AddIncomeController>(() => AddIncomeController(),);
  }
}