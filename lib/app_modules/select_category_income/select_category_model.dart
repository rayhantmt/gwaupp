import 'package:get/get.dart';

class SelectCategoryModel {
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

  SelectCategoryModel({
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
  factory SelectCategoryModel.fromApi(Map<String, dynamic> json) {
    return SelectCategoryModel(
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
  factory SelectCategoryModel.fromDefault(Map<String, dynamic> json) {
    return SelectCategoryModel(
      category: json['category_name'] ?? '',
      isSelected: false.obs,
      isDefault: json['isDefault'] ?? true,
    );
  }
}