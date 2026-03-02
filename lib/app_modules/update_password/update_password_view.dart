import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/update_password/update_password_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/utils/app_images.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
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
            SizedBox(height: Get.height * 0.06),
            Image.asset(AppImages.backIcon, height: Get.height * 0.06),
            SizedBox(height: Get.height * 0.03),
            Container(
              height: Get.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create New Password',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    Text(
                      'Secure your account with a strong 8-digit password.',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    Obx(
                      () => CommonTextField(
                        tittle: 'New Password',
                        obsecure: controller.isObsecure.value,
                        suffix: GestureDetector(
                          onTap: () => controller.toggle(),
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                     Obx(
                      () => CommonTextField(
                        tittle: 'Confirm New Password',
                        obsecure: controller.isObsecure2.value,
                        suffix: GestureDetector(
                          onTap: () => controller.toggle2(),
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            CommonButton(tittle: 'Create New Password'),
            SizedBox(height: Get.height*0.1,)
          ],
        ),
      ),
    );
  }
}
