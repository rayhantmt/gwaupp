import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController{
  late String firstname;
  late String lastname;
  String get fullName => '$firstname $lastname';
  @override
  void onInit() {
    firstname = GetStorage().read('firstName');
    lastname=GetStorage().read('lastName');
    super.onInit();
  }
}