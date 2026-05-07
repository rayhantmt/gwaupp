import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      print('Data from the api');
      print(user);
      storage.write('firstname', user['firstName']);
      storage.write('lastname', user['lastName']);
      storage.write('email', user['email']);
      storage.write('profileimg', user['imageUrl']);
      storage.write('id', user['_id']);
      storage.write('subscriptiontype', user['subscription_Type']);
      storage.write('token', accessToken);
      Get.offAllNamed(AppPages.mainscreen);
      print("Login success: $response");
      print(accessToken);
      final name=storage.read('firstname');
      print('Stored name$name');
    } on AppException catch (e) {
      Get.snackbar("Login Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
RxBool isLoading2=false.obs;
  Future<void> signInWithGoogle(BuildContext context) async {
  try {
    isLoading2.value=true;
    // Step 1: Google Sign-In
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return; // User cancelled

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Step 2: Firebase Auth
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;
    if (user == null) return;

    // Step 3: Extract user data from Google
    final String? email = user.email;
    final String? imageUrl = user.photoURL;
    final String? firstName = user.displayName?.split(' ').first;

    // Step 4: Send to your backend
  final response = await ApiService.post(
  endpoint: '/api/v1/auth/google-login',
  body: {
    "email": email,
    "imageUrl": imageUrl,
    "firstName": firstName,
  },
);

print('✅ Backend response: $response');

if (response['success'] == true) {
  final storage = GetStorage();
  final accessToken = response['data']['accessToken'];
  final user = response['data']['user'];  // ← 'result' not 'userData'

  storage.write('firstname', user['firstName']);
  storage.write('lastname', user['lastName']);
  storage.write('email', user['email']);
  storage.write('profileimg', user['imageUrl']);
  storage.write('id', user['_id']);
  storage.write('subscriptiontype', user['subscription_Type']);
  storage.write('token', accessToken);

  print('✅ Google Login success');
  print('Access Token: $accessToken');
  final name = storage.read('firstname');
  print('Stored name: $name');

  Get.offAllNamed(AppPages.mainscreen);
} else {
  print('❌ Google Login failed: ${response['message']}');
  Get.snackbar(
    'Login Failed',
    response['message'] ?? 'Something went wrong',
    snackPosition: SnackPosition.BOTTOM,
  );
}

  } catch (e) {
    print('❌ Google Sign-In failed: $e');
    // Show a snackbar or dialog if needed
    Get.snackbar('Error', e.toString());
  }
  finally{
    isLoading2.value=false;
  }
}
}
