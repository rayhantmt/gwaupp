import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_controller.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/utils/app_images.dart';

class CreateNewAccountView extends GetView<CreateNewAccountController> {
  const CreateNewAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAF8),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: Get.height*0.03,),
              Container(
                height: Get.height*0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffffffff)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create New Account',
                      style: GoogleFonts.montserrat( 
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xff1E1E1E)
                      ),
                      ),
                      Text('Enter your email and create a strong 8-digit password to create your account.',
                      style: GoogleFonts.inter( 
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B6B6B)
                      ),
                      ),
                      CommonTextField(tittle: 'Email Address', obsecure: false),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.02,),
              Text('')
            ],
          ),
        ),
      ),
    );
  }
}