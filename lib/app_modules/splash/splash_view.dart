import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gwaupp/utils/app_pages.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
  

}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),
    (){
       Get.toNamed(AppPages.login);
    }
    );
   
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}