import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/utils/app_images.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Column(
        children: [
          SizedBox(height: Get.height*0.06,),
          Text('Change Email Address',
          style: GoogleFonts.inter( 
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Color(0xff1E1E1E)
          ),
          )
        ],
      ),
    );
  }
}