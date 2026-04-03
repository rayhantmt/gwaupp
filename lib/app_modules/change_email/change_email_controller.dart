import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/utils/app_pages.dart';

class ChangeEmailController extends GetxController{
  final emailcontroller=TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> sendotp() async {
    isLoading.value = true;

    final body = {
      "email": emailcontroller.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.changeemail,
        body: body,
      );

     Get.offNamed(AppPages.otpverificationemail,
     arguments: {
      'email':emailcontroller.text
     }
     );
      print("success: $response");
    } on AppException catch (e) {
      Get.snackbar("Otp send Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}