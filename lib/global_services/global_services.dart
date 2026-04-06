import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalServicesController extends GetxController {
  final _storage = GetStorage();
  
  // 1. Create separate observables for both names
  var firstName = ''.obs;
  var lastName = ''.obs;
  var profileimg=''.obs;

  // 2. A "Computed" getter to easily show the full name in UI
  //String get fullName => "${firstName.value} ${lastName.value}".trim();

  @override
  void onInit() {
    super.onInit();
    // 3. Initialize from storage using your specific keys
    firstName.value = _storage.read('firstname') ?? 'Guest';
    lastName.value = _storage.read('lastname') ?? '';
    profileimg.value=_storage.read('profileimg');
  }

  // 4. Update both Storage (Persistence) and Observables (UI)
  void updateUserData(String fName, String lName) {
    _storage.write('firstname', fName);
    _storage.write('lastname', lName);

    firstName.value = fName;
    lastName.value = lName;
  }
  void updatprofileimage(imgurl){
    _storage.write('profileimg', imgurl);
    profileimg.value=imgurl;
  }
}