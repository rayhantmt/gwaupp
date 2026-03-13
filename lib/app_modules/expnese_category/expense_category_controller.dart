import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gwaupp/app_modules/expnese_category/expense_category_model.dart';

class ExpenseCategoryController extends GetxController{
  var categories=<ExpenseCategoryModel>[
   ExpenseCategoryModel(categorytype: 'Dining Outside'),
   ExpenseCategoryModel(categorytype: 'Travel outside'),
   ExpenseCategoryModel(categorytype: 'Rental Income'),
   ExpenseCategoryModel(categorytype: 'Gift Revieved'),
   ExpenseCategoryModel(categorytype: 'Random Expense'),
   ExpenseCategoryModel(categorytype: 'Car repair')
  ];
}