import 'package:get/get.dart';
import 'package:gwaupp/app_modules/income_history/income_history_controller.dart';

class IncomeHistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IncomeHistoryController>(() => IncomeHistoryController(),);
  }
}