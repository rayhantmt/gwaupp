import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
            GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(AppImages.backIcon,
              height: Get.height*0.06,
              ),
            ),
            SizedBox(height: Get.height*0.03,),
            Container(
              height: Get.height*0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account Verification',
                    style: GoogleFonts.montserrat( 
                      fontWeight: FontWeight.w600,
                      fontSize:24,
                    ),
                    ),
                    Text('Enter your email address to recieve a one-time verification code.',
                    style: GoogleFonts.inter( 
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff6B6B6B)
                    ),
                    ),
                    CommonTextField(tittle: 'Email Address', obsecure: false),
                
                  
                  ],
                ),
              ),
            ),
                Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.verifyotpforgotpass),
                child: CommonButton(tittle: 'Sned OTP')),
                    SizedBox(height: Get.height*0.08,)
          ],
        ),
      ),
    );
  }
}