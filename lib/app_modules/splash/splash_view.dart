import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gwaupp/utils/app_images.dart';

import 'package:gwaupp/utils/app_pages.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
  

}

class _SplashViewState extends State<SplashView> {
  @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 2),
  //   (){
  //      Get.toNamed(AppPages.login);
  //   }
  //   );
   
  //   super.initState();
  // }
  void initState() {
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      final token=GetStorage().read('token');
      print(token);
      if(token==null){
        Get.offAllNamed(AppPages.login);
      }
      else{
        Get.offAllNamed(AppPages.mainscreen);
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppImages.splashScreen,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      ),
    );
  }
}