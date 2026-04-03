import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/utils/app_pages.dart';

class CreateNewAccountController extends GetxController {
  RxBool isObsecure = true.obs;
  void toggle() {
    isObsecure.value = !isObsecure.value;
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> signup() async {
    isLoading.value = true;

    final body = {
      "email": emailcontroller.text.trim(),
      "password": passwordcontroller.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.signupurl,
        body: body,
      );

      Get.toNamed(AppPages.otppage);
      print("success: $response");
    } on AppException catch (e) {
      Get.snackbar("Account Creation Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
