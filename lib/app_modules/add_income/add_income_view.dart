import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/add_income/add_income_controller.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class AddIncomeView extends GetView<AddIncomeController> {
  const AddIncomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
         
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xff1E1E1E),
                ),
                SizedBox(width: Get.width * 0.08),
                Text(
                  'Add Income',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.04),
            Text(
              'Date & Time',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff1E1E1E),
              ),
            ),
            Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedStart = await showDatePicker(
                      context: context,
                      initialDate: controller.startDate.value ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(3000),
                      helpText: 'Select date',
                    );
                    if (pickedStart == null) return;
                    controller.startDate.value = pickedStart;
                  },
                  child: Obx(
                    () => Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Color(0xffE6E6E3)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xff6B6B6B),
                            ),
                            Text(controller.formattedDateRange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? pickedStart = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedStart == null) return;
                    controller.startTime.value = pickedStart;
                  },
                  child: Obx(
                    () => Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Color(0xffE6E6E3)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xff6B6B6B),
                          ),
                          Text(controller.formattedStartTime),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Text('Category',
            style: GoogleFonts.inter( 
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff1E1E1E)
            ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.selectcategory),
              child: Container(
                height: Get.height*0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Color(0xffD8D9E0)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(AppImages.incomeCategory,
                      color: Color(0xff6B6B6B),
                    height: Get.height*0.035,
                      ),
                      SizedBox(width: Get.width*0.05,),
                      Text('Select a category',
                      style: GoogleFonts.inter( 
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B6B6B)
                      ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,
                      color: Color(0xff6B6B6B),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
