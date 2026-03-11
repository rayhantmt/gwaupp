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
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Text(
                  'Income History',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Spacer(),
                Image.asset(
                  AppImages.incomeCategory,
                  height: Get.height * 0.03,
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            // GestureDetector(
            //   onTap: () async {
            //     DateTime? pickeddate = await showDatePicker(
            //       context: context,
            //       firstDate: DateTime.now(),
            //       lastDate: DateTime(3000),
            //     );
            //     controller.datecontroller.value = pickeddate!;
            //   },
            //   child: Container(
            //     height: Get.height * 0.05,
            //     width: Get.width * 0.6,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100),
            //       color: Color(0xffFFFFFF),
            //       border: Border.all(width: 1, color: Color(0xffE6E6E3)),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(
            //           Icons.calendar_month_outlined,
            //           color: Color(0xff6B6B6B),
            //         ),
            //         Text(controller.datecontroller.value.toString()),
            //       ],
            //     ),
            //   ),
            // ),
            // In your widget
            GestureDetector(
              onTap: () async {
                // Pick START date
                DateTime? pickedStart = await showDatePicker(
                  context: context,
                  initialDate: controller.startDate.value ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(3000),
                  helpText: 'Select start date',
                );

                if (pickedStart == null) return;

                // Pick END date (must be after start)
                DateTime? pickedEnd = await showDatePicker(
                  context: context,
                  initialDate: pickedStart,
                  firstDate: pickedStart, // 👈 forces end >= start
                  lastDate: DateTime(3000),
                  helpText: 'Select end date',
                );

                if (pickedEnd == null) return;

                controller.startDate.value = pickedStart;
                controller.endDate.value = pickedEnd;
              },
              child: Obx(
                () => Container(
                  height: Get.height * 0.05,
                  //width: Get.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffFFFFFF),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffE6E6E3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xff6B6B6B),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        controller.formattedDateRange,
                        style: const TextStyle(
                          color: Color(0xff6B6B6B),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //SizedBox(height: Get.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: controller.inconedata.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: Get.height * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            color: Color(0xff333333).withOpacity(0.15),
                            // spreadRadius: 12
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(controller.inconedata[index].datetime),
                                Spacer(),
                                Text(
                                  '\$${controller.inconedata[index].amount}',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xff0F3D2E),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              controller.inconedata[index].tittle,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Note: ',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff6B6B6B),
                                  ),
                                ),
                                Text(
                                  controller.inconedata[index].note,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff1E1E1E),
                                  ),
                                ),
                              ],
                            ),
                            controller.inconedata[index].bank
                                ? Row(
                                    children: [
                                      Image.asset(
                                        AppImages.bankicon,
                                        height: Get.height * 0.05,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'US Bank',
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff1E1E1E),
                                            ),
                                          ),
                                          Text(
                                            'James Walker | Savings',
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff6B6B6B),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color(0xffFCECEB),
                                        child: Icon(
                                          Icons.delete_outline_rounded,
                                          color: Color(0xffC84B4B),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(children: [
Image.asset(AppImages.cashicon,
height: Get.height*0.05,
),
Text('Cash',
style: GoogleFonts.inter( 
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Color(0xff1E1E1E)
),
)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
