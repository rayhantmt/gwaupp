import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            SizedBox(height: Get.height*0.05,),
            Container(
              height: Get.height*0.5,
              width: Get.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF)
              ),
              child: Column(
                children: [
                  Text('Sign In',
                  style: GoogleFonts.montserrat( 
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xff1E1E1E)
                  ),
                  ),
                  Text('Please enter your email address & password',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff6B6B6B)
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}