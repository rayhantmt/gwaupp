import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/utils/app_images.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height*0.06,),
            Image.asset(AppImages.backIcon,
            height: Get.height*0.06,
            ),
            SizedBox(height: Get.height*0.03,),
            Container(
              height: Get.height*0.3,
              width: double.infinity,
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