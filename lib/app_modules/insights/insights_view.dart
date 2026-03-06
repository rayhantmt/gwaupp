import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/utils/app_images.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.06,),
            Row(
              children: [
                Icon( Icons.arrow_back_ios_new,
                color: Colors.black,
                ),
                SizedBox(width: Get.width*0.02,),
                Text('Insights',
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
      ),
    );
  }
}