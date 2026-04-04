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
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_service.dart';
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
    final token=GetStorage().read('token');
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ApiService.get(
        endpoint: '/api/v1/category/get-my-category?type=income', 
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        },
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

  void toggle(bool b, int i) {
    categories[i].isSelected.value = b;
  }
}