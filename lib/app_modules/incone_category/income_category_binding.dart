import 'package:get/get.dart';
import 'package:gwaupp/app_modules/incone_category/income_category_controller.dart';

class IncomeCategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IncomeCategoryController>(() => IncomeCategoryController(),);
  }
}