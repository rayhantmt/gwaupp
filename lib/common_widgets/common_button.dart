import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class  CommonButton extends StatelessWidget {
  final String tittle;
  const  CommonButton({super.key, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Color(0xff0F3D2E)
      ),
      child: Center(
        child: Text(tittle,
        style: GoogleFonts.inter( 
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white
        ),
        ),
      ),
    );
  }
}