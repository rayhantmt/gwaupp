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
      body: Column(
        children: [
          SizedBox(height: Get.height*0.06,),
          Row(
            children: [
              Icon(Icons.arrow_back_ios_rounded,
              color: Color(0xff1E1E1E),
              ),
              Text('Income History',
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
    );
  }
}