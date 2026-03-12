import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/select_category/select_category_controller.dart';
import 'package:gwaupp/utils/app_images.dart';

class SelectCategoryView extends GetView<SelectCategoryController> {
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
           // SizedBox(height: Get.height * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: controller.categories.length,
                itemBuilder: (context, index) => Container(
                  height: Get.height * 0.04,
                  child: Row(
                    children: [
                      Text(
                        controller.categories[index].category,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff2B2B2B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
