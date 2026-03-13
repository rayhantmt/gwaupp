import 'package:get/get.dart';
import 'package:gwaupp/app_modules/select_category_expense/select_category_expense_model.dart';

class SelectCategoryExpenseController extends GetxController{
    var categories=<SelectCategoryExpenseModel>[
    SelectCategoryExpenseModel(category: 'Dining Outside',isSelected: false.obs),
    SelectCategoryExpenseModel(category: 'Travel outside',isSelected: false.obs),
    SelectCategoryExpenseModel(category: 'Annual Tour',isSelected: false.obs),
    SelectCategoryExpenseModel(category: 'Annual Tour',isSelected: false.obs),
    SelectCategoryExpenseModel(category: 'Random Expense',isSelected: false.obs),
    SelectCategoryExpenseModel(category: 'Car repair',isSelected: false.obs)
  ];
  void toggle(bool b,int i){
    categories[i].isSelected.value=b;
  }
}