import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:intl/intl.dart';

class AddExpenseController extends GetxController {
  // In AddExpenseController
  var selectedcat = 'Select'.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // safely read only if args exist
  //   final args = Get.arguments;
  //   if (args != null) {
  //     selectedcat.value = args['selected'] ?? 'Select';
  //   }
  // }
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  String get formattedDateRange {
    if (startDate.value == null) {
      return 'Select date';
    }
    final start = startDate.value != null
        ? DateFormat('MM/dd/yy').format(startDate.value!)
        : '?';

    return '$start';
  }

  String get formattedStartTime {
    if (startTime.value == null) return 'Time';
    final hour = startTime.value!.hourOfPeriod == 0
        ? 12
        : startTime.value!.hourOfPeriod;
    final minute = startTime.value!.minute.toString().padLeft(2, '0');
    final period = startTime.value!.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  var selectedMethod = 0.obs; // 0=Cash, 1=Credit, 2=Bank

  void selectMethod(int index) {
    selectedMethod.value = index;
  }

  RxBool repeatedTrans = false.obs;
  void togglerepeated(bool b) {
    repeatedTrans.value = b;
  }

  final amountcontroller = TextEditingController();
  final notecontroller = TextEditingController();
  var isLoading2 = false.obs;
  Future<void> addNewCategory() async {
    final token = GetStorage().read('token');
    final body = {
      "date_time": "2026-04-07T10:30:00.000Z",
      "type": "expense",
      "category": selectedcat.value,
      "payment_method": "cash",
      "amount": amountcontroller.text,
      "note": notecontroller.text,
      "repeat": repeatedTrans.value,
    };

    isLoading2.value = true;
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.addnewcategory,
        body: body,
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
      );
      Get.snackbar('Success', 'Expense added successfully');
      print("Expense Added: $response");
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
}
