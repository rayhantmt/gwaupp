import 'package:get/get.dart';

// class SelectCategoryExpenseModel {
//   final String category;
//   RxBool isSelected;
//   SelectCategoryExpenseModel({required this.isSelected, required this.category});
// }
import 'package:get/get.dart';

class SelectCategoryExpenseModel {
  // --- UI field (pre-built) ---
  final String category;
  RxBool isSelected;

  // --- API fields (from result[]) ---
  final String? id;
  final String? type;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;

  // --- Default category field ---
  final bool isDefault;

  SelectCategoryExpenseModel({
    required this.category,
    required this.isSelected,
    this.id,
    this.type,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.isDefault = false,
  });

  /// From user-created category (result[])
  factory SelectCategoryExpenseModel.fromApi(Map<String, dynamic> json) {
    return SelectCategoryExpenseModel(
      category: json['category_name'] ?? '',
      isSelected: false.obs,
      id: json['_id'],
      type: json['type'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isDefault: false,
    );
  }

  /// From DEFAULT_CATEGORIES[]
  factory SelectCategoryExpenseModel.fromDefault(Map<String, dynamic> json) {
    return SelectCategoryExpenseModel(
      category: json['category_name'] ?? '',
      isSelected: false.obs,
      isDefault: json['isDefault'] ?? true,
    );
  }
}