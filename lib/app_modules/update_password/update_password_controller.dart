import 'package:get/get.dart';

class UpdatePasswordController extends GetxController{
  RxBool isObsecure = true.obs;
  void toggle() {

    isObsecure.value = !isObsecure.value;
  
  }
  

  RxBool isObsecure2 = true.obs;
  void toggle2() {

    isObsecure2.value = !isObsecure2.value;
  
  }
  
}