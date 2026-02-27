import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/utils/app_images.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAF8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height*0.17,),
            Image.asset(AppImages.logo),
            Container(
              height: Get.height*0.5,
              width: Get.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF)
              ),
            )
          ],
        ),
      ),
    );
  }
}