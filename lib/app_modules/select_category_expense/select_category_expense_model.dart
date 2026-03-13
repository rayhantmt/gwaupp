import 'package:get/get.dart';

class SelectCategoryExpenseModel {
  final String category;
  RxBool isSelected;
  SelectCategoryExpenseModel({required this.isSelected, required this.category});
}
