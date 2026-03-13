import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gwaupp/app_modules/expense_history/expense_history_model.dart';
import 'package:intl/intl.dart';

class ExpenseHistoryController extends GetxController{
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

  var inconedata = <ExpenseHistoryModel>[
    ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Outside Dining',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      false,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Annual Tour',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Food & Groceries',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      false,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Monthly Salary',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Health Check Up',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      false,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Utilites ',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      false,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Outing & Party',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Outing & Party',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Outing & Party',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Outing & Party',
      note: 'Daily shop sales',
    ),
     ExpenseHistoryModel(
      true,
      datetime: '23 Sep 25, 11:24 AM',
      amount: '2,000',
      tittle: 'Outing & Party',
      note: 'Daily shop sales',
    ),

  ];

}