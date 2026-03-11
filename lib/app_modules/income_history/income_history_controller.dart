import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IncomeHistoryController extends GetxController{
 // Rx<DateTime> datecontroller=DateTime.now().obs;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  String get formattedDateRange {
    if (startDate.value == null && endDate.value == null) {
      return 'Select date range';
    }
    final start = startDate.value != null
        ? DateFormat('dd MMM yy').format(startDate.value!)
        : '?';
    final end = endDate.value != null
        ? DateFormat('dd MMM yy').format(endDate.value!)
        : '?';
    return '$start - $end';
  }
}