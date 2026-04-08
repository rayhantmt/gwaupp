
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/app_modules/income_history/income_history_model.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:intl/intl.dart';

class IncomeHistoryController extends GetxController {
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
  var inconedata = <IncomeHistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchIncomeHistory();
  }

  Future<void> fetchIncomeHistory() async {
    final token=GetStorage().read('token');
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ApiService.get(
        endpoint: ApiConfig.getincome,
        headers: {
          'Authorization':token
        } // 🔁 replace with your actual endpoint
      );

      if (response['success'] == true) {
        final List data = response['data'];
        inconedata.value =
            data.map((item) => IncomeHistoryModel.fromJson(item)).toList();
      } else {
        errorMessage.value = response['message'] ?? 'Something went wrong';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}