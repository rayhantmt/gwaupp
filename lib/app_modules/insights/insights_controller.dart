import 'package:get/get.dart';
import 'package:gwaupp/app_modules/insights/insights_model.dart';

class InsightsController extends GetxController{
  RxBool isexpense=true.obs;
  void toggle(){
    isexpense.value=!isexpense.value;
  }
  var quatardata=[
    InsightsModel(quater: 'Q1'),
    InsightsModel(quater: 'Q2'),
    InsightsModel(quater: 'Q3'),
    InsightsModel(quater: 'Q4')
  ];
}