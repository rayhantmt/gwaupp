import 'package:get/get.dart';
import 'package:gwaupp/app_modules/income_history/income_history_model.dart';
import 'package:intl/intl.dart';

class IncomeHistoryController extends GetxController {
  // Rx<DateTime> datecontroller=DateTime.now().obs;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

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

  var inconedata = <IncomeHistoryModel>[
    IncomeHistoryModel(
      TransType.bank,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.credit,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.cash,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.cash,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.credit,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.bank,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.bank,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.bank,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.credit,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.credit,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     IncomeHistoryModel(
      TransType.bank,
      datetime: '9/13/25 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),

  ];
}
