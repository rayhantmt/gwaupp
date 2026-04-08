import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:intl/intl.dart';

class AddIncomeController extends GetxController{
   var selectedcat = 'Select'.obs;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
    String get formattedDateRange {
    if (startDate.value == null ) {
      return 'Select date';
    }
    final start = startDate.value != null
        ? DateFormat('MM/dd/yy').format(startDate.value!)
        : '?';
    
    return '$start';
  }
  String get formattedStartTime {
  if (startTime.value == null) return ' Time';
  final hour = startTime.value!.hourOfPeriod == 0 ? 12 : startTime.value!.hourOfPeriod;
  final minute = startTime.value!.minute.toString().padLeft(2, '0');
  final period = startTime.value!.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}
  String get iso8601DateTime {
    // Return an empty string or null if either value isn't selected yet
    if (startDate.value == null || startTime.value == null) return '';

    // 1. Create a combined DateTime object
    final combinedDateTime = DateTime(
      startDate.value!.year,
      startDate.value!.month,
      startDate.value!.day,
      startTime.value!.hour,
      startTime.value!.minute,
    );

    // 2. Convert to UTC and get ISO 8601 string
    // Output: 2026-04-07T10:30:00.000Z
    return combinedDateTime.toUtc().toIso8601String();
  }

  var selectedMethod = 0.obs; // 0=Cash, 1=Credit, 2=Bank
var selectedMethodName = 'Cash'.obs;
  void selectMethod(int index) {
    selectedMethod.value = index;
     if (index == 0) {
      selectedMethodName.value = 'Cash';
    } else if (index == 1) {
      selectedMethodName.value = 'Credit';
    } else if (index == 2) {
      selectedMethodName.value = 'Bank';
    }
  }
  RxBool repeatedTrans=false.obs;
  void togglerepeated (bool b){
repeatedTrans.value=b;
  }

  final amountcontroller = TextEditingController();
  final notecontroller = TextEditingController();
  var isLoading2 = false.obs;
  Future<void> addIncome() async {
    final token = GetStorage().read('token');
    final body = {
      "date_time": iso8601DateTime,
      "type": "income",
      "category": selectedcat.value,
      "payment_method": selectedMethodName.value,
      "amount": amountcontroller.text,
      "note": notecontroller.text,
      "repeat": repeatedTrans.value,
    };

    isLoading2.value = true;
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.addexpenseorincome,
        body: body,
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
      );
      Get.snackbar('Success', 'Income added successfully');
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