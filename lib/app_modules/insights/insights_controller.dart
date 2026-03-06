import 'package:get/get.dart';
import 'package:gwaupp/app_modules/insights/insights_model.dart';

class InsightsController extends GetxController{
  RxBool isexpense=true.obs;
  void toggle(){
    isexpense.value=!isexpense.value;
  }
 
  var page=0.obs;
  void togglepage(int i){
    page.value=i;
  }
  var monthlyDataList = <MonthlyData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    monthlyDataList.assignAll([
      MonthlyData(month: "Jan", value: 30),
      MonthlyData(month: "Feb", value: 50),
      MonthlyData(month: "Mar", value: 20),
      MonthlyData(month: "Apr", value: 80),
      MonthlyData(month: "May", value: 60),
      MonthlyData(month: "Jun", value: 40),
    ]);
  }
}