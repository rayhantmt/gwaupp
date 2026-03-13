import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CahngePasswordView extends StatelessWidget {
  const CahngePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
              ],)
            ],
          ),
        ),
      ),
    );
  }
}