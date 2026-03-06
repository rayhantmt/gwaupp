import 'package:get/get.dart';
import 'package:gwaupp/app_modules/my_profile/my_profile_contorller.dart';

class MyProfileBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<MyProfileContorller>(
    () => MyProfileContorller(),
  );
  }
}