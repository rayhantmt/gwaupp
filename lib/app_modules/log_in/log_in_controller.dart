import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/api_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/utils/app_pages.dart';

class LogInController extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool isObsecure = true.obs;
  void toggle() {
    isObsecure.value = !isObsecure.value;
  }

  RxBool ischeck = false.obs;
  void togglechekc(val) {
    ischeck.value = val;
  }

  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final body = {
      "email": emailcontroller.text.trim(),
      "password": passwordcontroller.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.loginendpoint,
        body: body,
      );
      final storage = GetStorage();
      final accessToken = response['data']['accessToken'];
      final user = response['data']['userData'];
      storage.write('firstName', user['firstName']);
      storage.write('email', user['email']);
      storage.write('profileimg', user['imageUrl']);
      storage.write('token', accessToken);
      Get.offAllNamed(AppPages.mainscreen);
      print("Login success: $response");
      print(accessToken);
    } on AppException catch (e) {
      Get.snackbar("Login Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
