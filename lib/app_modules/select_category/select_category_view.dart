import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/utils/app_images.dart';

class SelectCategoryView extends StatelessWidget {
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xff1E1E1E),
                ),
                SizedBox(width: Get.width * 0.05),
                Text(
                  'Select Category',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Container(
              height: Get.height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000),
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Color(0xff000000).withOpacity(0.1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: Get.width * 0.05),
                  Icon(Icons.search, color: Color(0xff6B6B6B)),
                  SizedBox(width: Get.width * 0.05),
                  Text(
                    'Select Category',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
