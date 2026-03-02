import 'package:get/get.dart';

class CreateNewAccountController extends GetxController{
  RxBool isObsecure = true.obs;
  void toggle() {

    isObsecure.value = !isObsecure.value;

  }
}