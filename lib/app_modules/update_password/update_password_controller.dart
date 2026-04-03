import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/utils/app_pages.dart';

class UpdatePasswordController extends GetxController {
  RxBool isObsecure = true.obs;
  void toggle() {
    isObsecure.value = !isObsecure.value;
  }

  RxBool isObsecure2 = true.obs;
  void toggle2() {
    isObsecure2.value = !isObsecure2.value;
  }

  final passcontroller = TextEditingController();
  late int otp;
  @override
  void onInit() {
    final arg = Get.arguments;
    otp = arg['otp'];
    super.onInit();
  }

  RxBool isLoading = false.obs;
  Future<void> verifyOtp() async {
    final body = {"otp": otp, 'password': passcontroller.text};

    isLoading.value = true; // Start loading
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.forgotpassotp,
        body: body,
      );
      final email = response['data']['email'];
      print('email is $email');

      print("OTP Verification Success: $response");
      Get.toNamed(AppPages.login);
    } on AppException catch (e) {
      Get.snackbar(
        'Verification Failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
