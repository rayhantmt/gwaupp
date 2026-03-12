import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gwaupp/app_modules/select_category/select_category_model.dart';

class SelectCategoryController extends GetxController{
  var categories=<SelectCategoryModel>[
    SelectCategoryModel(category: 'Monthly Salary'),
    SelectCategoryModel(category: 'Bsuiness Income'),
    SelectCategoryModel(category: 'Rental Income'),
    SelectCategoryModel(category: 'Gift Received'),
    SelectCategoryModel(category: 'Consulting Fees'),
    SelectCategoryModel(category: 'Service Charge')
  ];
}