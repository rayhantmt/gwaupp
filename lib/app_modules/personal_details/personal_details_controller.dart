import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/api_services/api_config.dart';
import 'package:gwaupp/api_services/dio_service.dart';
import 'package:gwaupp/api_services/exceptions.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetailsController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  Rxn<XFile> profileImage = Rxn<XFile>();
  Future<void> pickProfileImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        profileImage.value = picked;
        uploadProfileImage();
      } else {
        print('Profile pick cancelled');
      }
    } catch (e) {
      print('Error picking profile image: $e');
      Get.snackbar('Error', 'Failed to pick profile image: $e');
    }
  }

  final DioClient _client = DioClient();
  late String email;
  @override
  final isLoading = false.obs;
  Future<void> uploadProfileImage() async {
    final token=GetStorage().read('token');
    isLoading.value = true;

    try {
      final formData = FormData.fromMap({
        'images': await MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!.name,
          // contentType: MediaType('image', 'png'),
        ),
      });

      // 4. API Call
      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/v1/auth/update-profile',
        data: formData,
        headers: {
          'Authorization':token
        }
      );

      print(' User Created: ${response.data}');
      Get.snackbar('Success', 'Profile image uploaded successfully');
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
