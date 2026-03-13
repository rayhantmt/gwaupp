import 'package:get/get.dart';

class ChangePasswordController extends GetxController{

  RxBool isObsecure = true.obs;
  void toggle() {

    isObsecure.value = !isObsecure.value;
  
  }
  RxBool isObsecure1 = true.obs;
  void toggle1() {

    isObsecure1.value = !isObsecure1.value;
  
  }
  RxBool isObsecure2 = true.obs;
  void toggle2() {

    isObsecure2.value = !isObsecure2.value;
  
  }
}