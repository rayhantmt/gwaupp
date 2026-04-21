
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
          ...defaultCategories.map(
            (e) => SelectCategoryExpenseModel.fromDefault(e),
          ),
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

  // void toggle(bool b, int i) {
  //   categories[i].isSelected.value = b;
  // }
   late String selectedcategory ;
  void toggle(bool value, int index,String category) {
 
  // 1. If the user is unchecking the only selected item, let them
  if (!value) {
    categories[index].isSelected.value = false;
    return;
  }

  // 2. Loop through all categories and set them to false
  for (var category in categories) {
    category.isSelected.value = false;
  }
 
  // 3. Set the clicked one to true
  categories[index].isSelected.value = true;
 
}

  @override
  void onClose() {
    newcategorycontroller.dispose();
    searchController.dispose();
    super.onClose();
  }

  RxBool isLoading3 = false.obs;

  Future<void> deleteCategory(String id) async {
    isLoading3.value = false;
    final token = GetStorage().read('token');
    final body = {"": ""};

    try {
      final response = await ApiService.delete(
        endpoint: '${ApiConfig.deletecategory}$id',
        body: body,
        headers: {"Authorization": token},
      );

      print("Category Deletion success: $response");
      fetchCategories();
    } on AppException catch (e) {
      Get.snackbar("Delete Failed", e.message);
    } finally {
      isLoading3.value = false;
    }
  }
}
