import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/insights/insights_controller.dart';
import 'package:gwaupp/utils/app_images.dart';

class InsightsView extends GetView<InsightsController> {
  const InsightsView({super.key});

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
                Icon(Icons.arrow_back_ios_new, color: Colors.black),
                SizedBox(width: Get.width * 0.02),
                Text(
                  'Insights',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.05),
            Obx(
              () => Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggle(),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: controller.isexpense.value
                            ? Color(0xff0F3D2E)
                            : Color(0xffC9A24D),
                      ),
                      child: Center(
                        child: Text(
                          'Expenses',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toggle(),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: controller.isexpense.value
                            ? Color(0xffC9A24D)
                            : Color(0xff0F3D2E),
                      ),
                      child: Center(
                        child: Text(
                          'Income',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
