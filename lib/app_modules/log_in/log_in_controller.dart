import 'package:get/get.dart';

class LogInController extends GetxController {
  RxBool isObsecure = true.obs;
  void toggle() {

    isObsecure.value = !isObsecure.value;
  
  }
  RxBool ischeck=false.obs;
  void togglechekc(val){
    ischeck.value=val;
  }
}
