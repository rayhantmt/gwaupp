import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class CreateYourProfileView extends StatelessWidget {
  const CreateYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height*0.06,
            ),
            Image.asset(AppImages.backIcon,
            height: Get.height*0.06,
            ),
            SizedBox(height: Get.height*0.05,),
            Container(
              height: Get.height*0.3,
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
                    Text('Create Your Profile',
                    style: GoogleFonts.montserrat( 
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xff1E1E1E)
                    ),
                    ),
                    Text('Enter your first and last name.',
                    style: GoogleFonts.inter( 
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff6B6B6B)
                    ),
                    ),
                    SizedBox(height: Get.height*0.03,),
                    CommonTextField(tittle: 'First Name', obsecure: false),
                    SizedBox(height: Get.height*0.02,),
                    CommonTextField(tittle: 'Last Name', obsecure: false)
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height*0.4,),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.login),
              child: CommonButton(tittle: 'Create Profile'))
          ],
        ),
      ),
    );
  }
}