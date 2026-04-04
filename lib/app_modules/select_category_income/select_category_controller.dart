// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:gwaupp/app_modules/select_category_income/select_category_model.dart';

// class SelectCategoryController extends GetxController {
//   var categories = <SelectCategoryModel>[
//     SelectCategoryModel(category: 'Monthly Salary', isSelected: false.obs),
//     SelectCategoryModel(category: 'Bsuiness Income', isSelected: false.obs),
//     SelectCategoryModel(category: 'Rental Income', isSelected: false.obs),
//     SelectCategoryModel(category: 'Gift Received', isSelected: false.obs),
//     SelectCategoryModel(category: 'Consulting Fees', isSelected: false.obs),
//     SelectCategoryModel(category: 'Service Charge', isSelected: false.obs),
//   ];
//   void toggle(bool b, int i) {
//     categories[i].isSelected.value = b;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/app_modules/select_category_income/select_category_model.dart';

class SelectCategoryController extends GetxController {
  var categories = <SelectCategoryModel>[].obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

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
        endpoint: ApiConfig.getincomecategories,
        headers: {'Content-Type': 'application/json', 'Authorization': token},
      );

      if (response['success'] == true) {
        final data = response['data'];

        final List userCategories = data['result'] ?? [];
        final List defaultCategories = data['DEFAULT_CATEGORIES'] ?? [];

        // merge both into single categories list
        categories.value = [
          ...userCategories.map((e) => SelectCategoryModel.fromApi(e)),
          ...defaultCategories.map((e) => SelectCategoryModel.fromDefault(e)),
        ];
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  final newcategorycontroller = TextEditingController();
  RxBool isLoading2 = false.obs;
  Future<void> addNewCategory() async {
    final token = GetStorage().read('token');
    final body = {
      "category_name": newcategorycontroller.text,
      "type": "income",
    };

    isLoading2.value = true; // Start loading
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.addnewcategory,
        body: body,
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
      );

      Get.snackbar('Category Added Successfully', response.toString());
      print("Category Added: $response");
     // Get.back();
    } on AppException catch (e) {
      Get.snackbar(
        'Category Adding failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading2.value = false; // Stop loading
    }
  }

  void toggle(bool b, int i) {
    categories[i].isSelected.value = b;
  }
}
