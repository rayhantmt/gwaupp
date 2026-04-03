import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/change_email/change_email_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/utils/app_images.dart';

class ChangeEmailView extends GetView<ChangeEmailController> {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Text(
                  'Change Email Address',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.32),
            CommonTextField(
              tittle: 'Set New Email',
              obsecure: false,
              controller: controller.emailcontroller,
            ),
            SizedBox(height: Get.height * 0.02),
            GestureDetector(
              onTap: () => controller.sendotp(),
              child: controller.isLoading.value
                  ? CircularProgressIndicator(color: AppImages.greencolor)
                  : CommonButton(tittle: 'Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
