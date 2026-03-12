import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gwaupp/app_modules/select_category/select_category_model.dart';

class SelectCategoryController extends GetxController{
  var categories=<SelectCategoryModel>[
    SelectCategoryModel(category: 'Monthly Salary',isSelected: false.obs),
    SelectCategoryModel(category: 'Bsuiness Income',isSelected: false.obs),
    SelectCategoryModel(category: 'Rental Income',isSelected: false.obs),
    SelectCategoryModel(category: 'Gift Received',isSelected: false.obs),
    SelectCategoryModel(category: 'Consulting Fees',isSelected: false.obs),
    SelectCategoryModel(category: 'Service Charge',isSelected: false.obs)
  ];
}