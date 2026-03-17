import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/log_in/log_in_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAF8),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.17),
            Image.asset(AppImages.logo),
            SizedBox(height: Get.height * 0.05),
            Container(
              height: Get.height * 0.45,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Please enter your email address & password',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    CommonTextField(tittle: 'Email Address', obsecure: false),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => CommonTextField(
                        tittle: 'Password',
                        obsecure: controller.isObsecure.value,
                        suffix: GestureDetector(
                          onTap: () => controller.toggle(),
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            checkColor: Colors.white,
                            activeColor: Color(0xff0F3D2E),
                            value: controller.ischeck.value,
                            onChanged: (value) => controller.togglechekc(value),
                          ),
                        ),
                        Text(
                          'Rememeber me',
                          style: GoogleFonts.inter(
                            color: Color(0xff6B6B6B),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppPages.forgotpassword),
                          child: Text(
                            'Forgot Passord?',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xff0F3D2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.03),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppPages.mainscreen),
                      child: CommonButton(tittle: 'Log In'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: Get.width * 0.4,
                  color: Color(0xffE6E6E3),
                ),
                SizedBox(width: Get.width * 0.01),
                Text('OR'),
                SizedBox(width: Get.width * 0.01),
                Container(
                  height: 1,
                  width: Get.width * 0.4,
                  color: Color(0xffE6E6E3),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Image.asset(AppImages.loginwithgoogle),
            SizedBox(height: Get.height * 0.02),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.createnewaccount),
              child: Text(
                'Create New Account',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff0F3D2E),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
