import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatelessWidget {
  final String tittle;
  final bool? obsecure;
  const CommonTextField({super.key, required this.tittle, this.obsecure});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tittle,
        style: GoogleFonts.inter( 
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color(0xff1E1E1E)
        ),
        ),
        SizedBox(height: Get.height*0.01,),
        Container(
          height: Get.height*0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xffD8D9E0),
              
            ),
            
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none
            )
          ),
        )
      ],
    );
  }
}