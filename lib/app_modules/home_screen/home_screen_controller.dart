import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreenController extends GetxController {
  final RxInt selectedMonth = DateTime.now().month.obs;
  final RxInt selectedYear = DateTime.now().year.obs;
  final RxString displayLabel = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _updateLabel();
  }

  void _updateLabel() {
    final monthName = DateFormat('MMM').format(
      DateTime(selectedYear.value, selectedMonth.value),
    );
    displayLabel.value = '$monthName ${selectedYear.value}';
   print(selectedMonth.value);
   print(selectedYear.value);
  }

  void updateMonth(int month) {
    selectedMonth.value = month;
    _updateLabel();
  }

  void updateYear(int year) {
    selectedYear.value = year;
    _updateLabel();
  }

  Map<String, String> get apiHeaders => {
    'x-month': selectedMonth.value.toString().padLeft(2, '0'),
    'x-year': selectedYear.value.toString(),
  };
}
