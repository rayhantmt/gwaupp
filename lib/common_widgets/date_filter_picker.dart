import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';

// Future<void> openMonthYearPicker(HomeScreenController controller) async {
//   final picked = await showMonthYearPicker(   // ← now correctly calls the package
//     context: Get.context!,
//     initialDate: DateTime(
//       controller.selectedYear.value,
//       controller.selectedMonth.value,
//     ),
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2100),
//     locale: const Locale('en'),
//   );

//   if (picked != null) {
//   controller.onDateSelected(picked.month, picked.year);
//   }
// }
Future<void> openMonthYearPicker(HomeScreenController controller) async {
  final picked = await showMonthYearPicker(
    context: Get.context!,
    initialDate: DateTime(
      controller.selectedYear.value,
      controller.selectedMonth.value,
    ),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    locale: const Locale('en'),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogTheme: DialogThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: EdgeInsets.zero,        // ✅ removes system padding
            viewPadding: EdgeInsets.zero,
          ),
          child: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.99, // ✅ forces width
              ),
              child: child!,
            ),
          ),
        ),
      );
    },
  );

  if (picked != null) {
    controller.onDateSelected(picked.month, picked.year);
  }
}