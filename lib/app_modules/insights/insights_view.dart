import 'package:fl_chart/fl_chart.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            SizedBox(height: Get.height * 0.02),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => controller.togglepage(0),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: controller.page.value == 0
                            ? Color(0xff0F3D2E)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Q1',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: controller.page.value == 0
                                ? Color(0xffFFFFFF)
                                : Color(0xff6B6B6B),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.togglepage(1),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: controller.page.value == 1
                            ? Color(0xff0F3D2E)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Q2',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: controller.page.value == 1
                                ? Color(0xffFFFFFF)
                                : Color(0xff6B6B6B),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.togglepage(2),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: controller.page.value == 2
                            ? Color(0xff0F3D2E)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Q3',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: controller.page.value == 2
                                ? Color(0xffFFFFFF)
                                : Color(0xff6B6B6B),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.togglepage(3),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: controller.page.value == 3
                            ? Color(0xff0F3D2E)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Q4',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: controller.page.value == 3
                                ? Color(0xffFFFFFF)
                                : Color(0xff6B6B6B),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height*0.05,),
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffEDF1F3),
              ),
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  backgroundColor: Colors.white,
                  alignment: BarChartAlignment.spaceAround,
                  maxY:
                      controller.monthlyDataList
                          .map((e) => e.value)
                          .reduce((a, b) => a > b ? a : b) +
                      10,
                  barGroups: controller.monthlyDataList.map((data) {
                    return BarChartGroupData(
                      x: controller.monthlyDataList.indexOf(data),
                      barRods: [
                        BarChartRodData(
                          toY: data.value,
                          color: Color(0xff317B62),
                          width: 18,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    );
                  }).toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          int index = value.toInt();
                          if (index < controller.monthlyDataList.length) {
                            return Text(
                              controller.monthlyDataList[index].month,
                            );
                          }
                          return const Text("");
                        },
                      ),
                    ),
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
