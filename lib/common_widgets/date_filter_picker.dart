import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';

Future<void> openMonthYearPicker(HomeScreenController controller) async {
  final picked = await showMonthYearPicker(   // ← now correctly calls the package
    context: Get.context!,
    initialDate: DateTime(
      controller.selectedYear.value,
      controller.selectedMonth.value,
    ),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    controller.updateMonth(picked.month);
    controller.updateYear(picked.year);
  }
}