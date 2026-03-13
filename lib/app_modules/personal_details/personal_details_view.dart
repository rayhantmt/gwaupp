import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/utils/app_images.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Column(
        children: [
          SizedBox(height: Get.height*0.06,),
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xff1E1E1E),
              ),
              SizedBox(width: Get.width*0.05,),
              Text('Personal Details',
              style: GoogleFonts.montserrat( 
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Color(0xff1E1E1E)
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}