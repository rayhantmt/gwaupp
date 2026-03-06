import 'package:get/get.dart';

class InsightsController extends GetxController{
  RxBool isexpense=true.obs;
  void toggle(){
    isexpense.value=!isexpense.value;
  }
}