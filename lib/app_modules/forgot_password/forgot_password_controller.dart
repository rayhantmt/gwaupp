import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/utils/app_pages.dart';

class ForgotPasswordController extends GetxController{
  final emailcontroller=TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> sendotp() async {
    isLoading.value = true;

    final body = {
      "email": emailcontroller.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.sendotp,
        body: body,
      );

     Get.toNamed(AppPages.verifyotpforgotpass);
      print("success: $response");
    } on AppException catch (e) {
      Get.snackbar("Otp send Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}