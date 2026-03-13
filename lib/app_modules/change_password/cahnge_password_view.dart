import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/change_password/change_password_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';

class CahngePasswordView extends GetView<ChangePasswordController> {
  const CahngePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.06,),
              Row(children: [
                Icon(Icons.arrow_back_ios_outlined,
                color: Color(0xff1E1E1E),
                ),

                SizedBox(width: Get.width*0.05,),
                Text('Change New Password',
                style: GoogleFonts.montserrat( 
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xff1E1E1E)
                ),
                )
              ],),
              SizedBox(height: Get.height*0.03,),
              Container(
                height: Get.height*0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Set New Password',
                    style: GoogleFonts.montserrat( 
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xff1E1E1E)
                    ),
                    ),
                    Text('To secure your account,create a strong 8 digit password',
                    style: GoogleFonts.inter( 
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff6B6B6B)
                    ),
                    ),
                    SizedBox(height: Get.height*0.02,),
                     Obx(
                      () => CommonTextField(
                        tittle: 'Current Password',
                        obsecure: controller.isObsecure.value,
                        suffix: GestureDetector(
                          onTap: () => controller.toggle(),
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                     Obx(
                      () => CommonTextField(
                        tittle: 'New Password',
                        obsecure: controller.isObsecure1.value,
                        suffix: GestureDetector(
                          onTap: () => controller.toggle1(),
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
            SizedBox(height: Get.height*0.33,),
              CommonButton(tittle: 'Set New Password'),
              SizedBox(height: Get.height*0.03,)
            ],
          ),
        ),
      ),
    );
  }
}