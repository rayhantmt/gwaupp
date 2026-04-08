import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/app_modules/expense_history/expense_history_model.dart';
import 'package:intl/intl.dart';

class ExpenseHistoryController extends GetxController{

Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  // ✅ Loading & error state
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  String get formattedDateRange {
    if (startDate.value == null && endDate.value == null) {
      return 'Select date range';
    }
    final start = startDate.value != null
        ? DateFormat('MM/dd/yy').format(startDate.value!)
        : '?';
    final end = endDate.value != null
        ? DateFormat('MM/dd/yy').format(endDate.value!)
        : '?';
    return '$start - $end';
  }

  // ✅ Changed to RxList so UI auto-updates when data loads
  var expensedata = <ExpenseHistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchExpenseHistory();
  }

  Future<void> fetchExpenseHistory() async {
    final token = GetStorage().read('token');
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ApiService.get(
        endpoint: ApiConfig.getexpense,
        headers: {
          'Authorization': token,
        }, // 🔁 replace with your actual endpoint
      );

      if (response['success'] == true) {
        final List data = response['data'];
        expensedata.value = data
            .map((item) => ExpenseHistoryModel.fromJson(item))
            .toList();
      } else {
        errorMessage.value = response['message'] ?? 'Something went wrong';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Filtered list — used in UI instead of inconedata directly
  List<ExpenseHistoryModel> get filteredData {
    if (startDate.value == null && endDate.value == null) {
      return expensedata; // no filter applied, return all
    }

    return expensedata.where((item) {
      if (item.datetime.isEmpty) return false;
      final itemDate = DateTime.tryParse(item.datetime)?.toLocal();
      if (itemDate == null) return false;

      // Strip time — compare dates only
      final itemDateOnly = DateTime(
        itemDate.year,
        itemDate.month,
        itemDate.day,
      );

      if (startDate.value != null && endDate.value != null) {
        final start = DateTime(
          startDate.value!.year,
          startDate.value!.month,
          startDate.value!.day,
        );
        final end = DateTime(
          endDate.value!.year,
          endDate.value!.month,
          endDate.value!.day,
        );
        return itemDateOnly.isAfter(start.subtract(Duration(days: 1))) &&
            itemDateOnly.isBefore(end.add(Duration(days: 1)));
      }

      if (startDate.value != null) {
        final start = DateTime(
          startDate.value!.year,
          startDate.value!.month,
          startDate.value!.day,
        );
        return itemDateOnly.isAfter(start.subtract(Duration(days: 1)));
      }

      if (endDate.value != null) {
        final end = DateTime(
          endDate.value!.year,
          endDate.value!.month,
          endDate.value!.day,
        );
        return itemDateOnly.isBefore(end.add(Duration(days: 1)));
      }

      return true;
    }).toList();
  }

  RxBool isLoading3 = false.obs;

  Future<void> deleteIncome(String id) async {
    isLoading3.value = false;
    final token = GetStorage().read('token');
    final body = {"": ""};

    try {
      final response = await ApiService.delete(
        endpoint: '${ApiConfig.deleteincomeorexpense}$id',
        body: body,
        headers: {"Authorization": token},
      );

      print("Income Deletion success: $response");
      fetchExpenseHistory();
    } on AppException catch (e) {
      Get.snackbar("Delete Failed", e.message);
    } finally {
      isLoading3.value = false;
    }
  }

}