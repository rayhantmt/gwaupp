import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddIncomeController extends GetxController{
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
    String get formattedDateRange {
    if (startDate.value == null ) {
      return 'Select date';
    }
    final start = startDate.value != null
        ? DateFormat('dd MMM yy').format(startDate.value!)
        : '?';
    
    return '$start';
  }
  String get formattedStartTime {
  if (startTime.value == null) return 'Start Time';
  final hour = startTime.value!.hourOfPeriod == 0 ? 12 : startTime.value!.hourOfPeriod;
  final minute = startTime.value!.minute.toString().padLeft(2, '0');
  final period = startTime.value!.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}

  var selectedMethod = 0.obs; // 0=Cash, 1=Credit, 2=Bank

  void selectMethod(int index) {
    selectedMethod.value = index;
  }
  RxBool repeatedTrans=false.obs;
  void togglerepeated (bool b){
repeatedTrans.value=b;
  }
}