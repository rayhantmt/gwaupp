// import 'package:get/get.dart';
// import 'package:gwaupp/app_modules/select_category_expense/select_category_expense_model.dart';

// class SelectCategoryExpenseController extends GetxController{
//     var categories=<SelectCategoryExpenseModel>[
//     SelectCategoryExpenseModel(category: 'Dining Outside',isSelected: false.obs),
//     SelectCategoryExpenseModel(category: 'Travel outside',isSelected: false.obs),
//     SelectCategoryExpenseModel(category: 'Annual Tour',isSelected: false.obs),
//     SelectCategoryExpenseModel(category: 'Annual Tour',isSelected: false.obs),
//     SelectCategoryExpenseModel(category: 'Random Expense',isSelected: false.obs),
//     SelectCategoryExpenseModel(category: 'Car repair',isSelected: false.obs)
//   ];
//   void toggle(bool b,int i){
//     categories[i].isSelected.value=b;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/app_modules/select_category_expense/select_category_expense_model.dart';

class SelectCategoryExpenseController extends GetxController {
  // ── displayed list (filtered by search) ──
  var categories = <SelectCategoryExpenseModel>[].obs;

  // ── source of truth (never touched after fetch) ──
  var allCategories = <SelectCategoryExpenseModel>[].obs;

  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var errorMessage = ''.obs;

  final newcategorycontroller = TextEditingController();
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final token = GetStorage().read('token');
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ApiService.get(
        endpoint: ApiConfig.getexpensecategories,
        headers: {'Content-Type': 'application/json', 'Authorization': token},
      );

      if (response['success'] == true) {
        final data = response['data'];

        final List userCategories = data['result'] ?? [];
        final List defaultCategories = data['DEFAULT_CATEGORIES'] ?? [];

        final merged = [
          ...userCategories.map((e) => SelectCategoryExpenseModel.fromApi(e)),
          ...defaultCategories.map((e) => SelectCategoryExpenseModel.fromDefault(e)),
        ];

        // store in both — allCategories is source, categories is what UI sees
        allCategories.value = merged;
        categories.value = merged;

        // re-apply search if user had typed something before refresh
        if (searchController.text.trim().isNotEmpty) {
          searchCategory(searchController.text);
        }
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addNewCategory() async {
    final token = GetStorage().read('token');
    final body = {
      "category_name": newcategorycontroller.text,
      "type": "expense",
    };

    isLoading2.value = true;
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.addnewcategory,
        body: body,
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
      );

      newcategorycontroller.clear();
      fetchCategories();
      Get.snackbar('Success', 'Category added successfully');
      print("Category Added: $response");
    } on AppException catch (e) {
      Get.snackbar(
        'Failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading2.value = false;
    }
  }

  void searchCategory(String query) {
    if (query.trim().isEmpty) {
      categories.value = allCategories;
    } else {
      categories.value = allCategories
          .where((e) => e.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void toggle(bool b, int i) {
    categories[i].isSelected.value = b;
  }

  @override
  void onClose() {
    newcategorycontroller.dispose();
    searchController.dispose();
    super.onClose();
  }
}
