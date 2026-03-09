import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/utils/app_images.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          SizedBox(height: Get.height*0.06,),
        ]),
      ),
    );
  }
}
