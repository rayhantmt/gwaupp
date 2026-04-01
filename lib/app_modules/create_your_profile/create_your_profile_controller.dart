import 'package:get/get.dart';

class CreateYourProfileController extends GetxController {
  late String email;
  @override
  void onInit() {
    final arg = Get.arguments;
email = arg['email'];
    print('From create account page email is $email');
    super.onInit();
  }


}
