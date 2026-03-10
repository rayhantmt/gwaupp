import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  final String tittle;
  final String img;

  const ProfileContainer({super.key, required this.tittle, required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img,
        height: Get.height*0.03,
        ),
        SizedBox(width: Get.width * 0.1),
        Text(
          tittle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff1E1E1E),
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios_rounded,
        color: Color(0xff6B6B6B),
        )
      ],
    );
  }
}
