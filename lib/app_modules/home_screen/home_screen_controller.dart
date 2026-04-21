// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:gwaupp/api_services/api_service.dart';
// import 'package:intl/intl.dart';

// class HomeScreenController extends GetxController {
//   final RxInt selectedMonth = DateTime.now().month.obs;
//   final RxInt selectedYear = DateTime.now().year.obs;
//   final RxString displayLabel = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _updateLabel();
//   }

//   void _updateLabel() {
//     final monthName = DateFormat(
//       'MMM',
//     ).format(DateTime(selectedYear.value, selectedMonth.value));
//     displayLabel.value = '$monthName ${selectedYear.value}';
//     print(apiHeaders);
//   }

//   // void updateMonth(int month) {
//   //   selectedMonth.value = month;
//   //   _updateLabel();
//   // }

//   // void updateYear(int year) {
//   //   selectedYear.value = year;
//   //   _updateLabel();
//   // }
//   void onDateSelected(int month, int year) {
//     selectedMonth.value = month;
//     selectedYear.value = year;
//     _updateLabel();
//     print(apiHeaders); // prints once
//     fetchData(
//       selectedYear.value,
//       selectedMonth.value,
//     ); // API call triggers here
//   }

//   var isLoading = false.obs;
//   Future<void> fetchData(var year, var month) async {
//     final token = GetStorage().read('token');
//     try {
//       isLoading.value = true;

//       final response = await ApiService.get(
//         endpoint: '/api/v1/target/analytics?year=$year&month=$month',
//         headers: {
//           'Authorization': token,
//         }, // 🔁 replace with your actual endpoint
//       );

//       if (response['success'] == true) {
//         print(response);
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Map<String, String> get apiHeaders => {
//     'x-month': selectedMonth.value.toString().padLeft(2, '0'),
//     'x-year': selectedYear.value.toString(),
//   };
// }
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_model.dart';
import 'package:intl/intl.dart';


class HomeScreenController extends GetxController {
  // --- Date ---
  final RxInt selectedMonth = DateTime.now().month.obs;
  final RxInt selectedYear = DateTime.now().year.obs;
  final RxString displayLabel = ''.obs;

  // --- Loading ---
  final RxBool isLoading = false.obs;

  // --- Analytics observables ---
  final RxString netSavingsAmount = '0.00'.obs;
  final RxDouble netSavingsChangePercent = 0.0.obs;
  final RxString incomeAmount = '0.00'.obs;
  final RxDouble incomeChangePercent = 0.0.obs;
  final RxString expenseAmount = '0.00'.obs;
  final RxDouble expenseChangePercent = 0.0.obs;
  final RxString spendingTarget = '0.00'.obs;
  final RxString spendingSpent = '0.00'.obs;
  final RxString spendingRemaining = '0.00'.obs;
  final RxString topCategory = ''.obs;
  final RxString topCategoryAmount = '0.00'.obs;

  @override
  void onInit() {
    super.onInit();
    _updateLabel();
    fetchData(selectedYear.value, selectedMonth.value); // fetch on load
  }

  void _updateLabel() {
    final monthName = DateFormat('MMM').format(
      DateTime(selectedYear.value, selectedMonth.value),
    );
    displayLabel.value = '$monthName ${selectedYear.value}';
  }

  void onDateSelected(int month, int year) {
    selectedMonth.value = month;
    selectedYear.value = year;
    _updateLabel();
    fetchData(year, month); // fetch on date change
  }

  Future<void> fetchData(int year, int month) async {
    final token = GetStorage().read('token');
    try {
      isLoading.value = true;

      final response = await ApiService.get(
        endpoint: '/api/v1/target/analytics?year=$year&month=$month',
        headers: {'Authorization': token},
      );

      if (response['success'] == true) {
        final model = AnalyticsModel.fromJson(response);
        _updateObservables(model);
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void _updateObservables(AnalyticsModel model) {
    netSavingsAmount.value = model.netSavingsAmount;
    netSavingsChangePercent.value = model.netSavingsChangePercent;
    incomeAmount.value = model.incomeAmount;
    incomeChangePercent.value = model.incomeChangePercent;
    expenseAmount.value = model.expenseAmount;
    expenseChangePercent.value = model.expenseChangePercent;
    spendingTarget.value = model.spendingTarget;
    spendingSpent.value = model.spendingSpent;
    spendingRemaining.value = model.spendingRemaining;
    topCategory.value = model.topCategory;
    topCategoryAmount.value = model.topCategoryAmount;
  }

  Map<String, String> get apiHeaders => {
    'x-month': selectedMonth.value.toString().padLeft(2, '0'),
    'x-year': selectedYear.value.toString(),
  };
}