import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatelessWidget {
  final String tittle;
  final bool obsecure;
  final Widget? suffix;
  const CommonTextField({super.key, required this.tittle,required this.obsecure, this.suffix});

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
          obscureText: obsecure!,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              suffix: suffix

            )
          ),
        )
      ],
    );
  }
}