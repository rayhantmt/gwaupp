import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData;
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/dio_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:gwaupp/utils/app_pages.dart';

class CreateYourProfileController extends GetxController {
  final DioClient _client = DioClient();
  late String email;
  @override
  void onInit() {
    final arg = Get.arguments;
    email = arg['email'];
    super.onInit();
  }

  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final isLoading = false.obs;
  Future<void> createUser() async {
    isLoading.value = true;

    try {
      final formData = FormData.fromMap({
        "firstName": firstnamecontroller.text,
        "lastName": lastnamecontroller.text,
        "email": email,
      });

      // 4. API Call
      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/v1/auth/update-profile',
        data: formData,
      );

      print(' User Created: ${response.data}');
      Get.snackbar('Success', 'User Created Successfully');
      Get.toNamed(AppPages.login);
    } on BadRequestException catch (e) {
      // Caught by our custom DioClient logic
      Get.snackbar('Registration Failed', e.toString());
      print('❌ API Error: $e');
    } on DioException catch (e) {
      // Catch generic Dio errors that might slip through
      Get.snackbar('Error', 'Network error: ${e.message}');
    } catch (e) {
      // Catch logic errors (like the one you were seeing)
      print('❌ Unexpected Error: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
