import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/income_history/income_history_controller.dart';
import 'package:gwaupp/utils/app_images.dart';

class IncomeHistoryView extends GetView<IncomeHistoryController> {
  const IncomeHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height*0.06,),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios_rounded,
                  color: Color(0xff1E1E1E),
                  ),
                ),
                Text('Income History',
                style: GoogleFonts.montserrat( 
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xff1E1E1E)
                ),
                ),
                Spacer(),
                Image.asset(AppImages.incomeCategory,
                height: Get.height*0.03,
                )
              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Container(
              height: Get.height*0.05,
              width: Get.width*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xffFFFFFF),
                border: Border.all(
                  width: 1,
                  color: Color(0xffE6E6E3)
                )
              ),
            )
            
          ],
        ),
      ),
    );
  }
}