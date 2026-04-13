import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/app_modules/insights/insights_model.dart';

class InsightsController extends GetxController {
  RxBool isexpense = true.obs;
  void toggle(String type) {
    apitype.value=type;
    fetchBusinessData();
    isexpense.value = !isexpense.value;
  }

  var page = 0.obs;
  void togglepage(int i,String select) {
    selected.value=select;
    fetchBusinessData();
    page.value = i;
  }

  @override
  void onInit() {
    fetchBusinessData();
    super.onInit();
  }
 var selected='Q1'.obs;
 var apitype='expense'.obs;
  var businessdata = <BusinessData>[].obs;
  var monthlyDataList = <MonthlyData>[].obs;
  var totalIncome = 0.obs;
  var isLoading = false.obs;

  Future<void> fetchBusinessData() async {
     final token = GetStorage().read('token');
    try {
      isLoading(true);
      final response = await ApiService.get(endpoint: '/api/v1/in_ex/insights?type=$apitype&quarter=$selected',
       headers: {'Authorization': token, },
      
      );

      if (response != null && response['success'] == true) {
        final data = response['data'];

        // total
        totalIncome.value = (data['total'] as num?)?.toInt() ?? 0;

        // category summary → businessdata
        final List categorySummary = data['categorySummary'] ?? [];
        businessdata.assignAll(
          categorySummary.map((e) => BusinessData.fromJson(e)).toList(),
        );

        // chart data → monthlyDataList
        final List chartData = data['chartData'] ?? [];
        monthlyDataList.assignAll(
          chartData.map((e) => MonthlyData.fromJson(e)).toList(),
        );
        print(response);
        print(monthlyDataList.iterator);
        print(businessdata.iterator);
      }
    } catch (e) {
      print('fetchBusinessData error: $e');
    } finally {
      isLoading(false);
    }
  }
}
