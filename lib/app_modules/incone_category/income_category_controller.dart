import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gwaupp/app_modules/incone_category/incone_category_model.dart';

class IncomeCategoryController extends GetxController{
  var categories=<InconeCategoryModel>[
   InconeCategoryModel(type: 'Monthly Salary'),
   InconeCategoryModel(type: 'Business Model'),
   InconeCategoryModel(type: 'Rental Income'),
   InconeCategoryModel(type: 'Gift Revieved'),
   InconeCategoryModel(type: 'Consulting Fees'),
   InconeCategoryModel(type: 'Service Charge')
  ];
}