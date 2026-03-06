import 'package:get/get.dart';
import 'package:gwaupp/app_modules/insights/insights_model.dart';

class InsightsController extends GetxController{
  RxBool isexpense=true.obs;
  void toggle(){
    isexpense.value=!isexpense.value;
  }
  var quatardata=[
    InsightsModel(quater: 'Q1',id: 0),
    InsightsModel(quater: 'Q2',id: 1),
    InsightsModel(quater: 'Q3',id: 2),
    InsightsModel(quater: 'Q4',id: 3)
  ];
  var page=0.obs;
  void togglepage(int i){
    page.value=i;
  }
}