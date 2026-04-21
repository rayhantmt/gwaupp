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
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(color: AppImages.greencolor),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.06),
                      Row(
                        children: [
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
                              onTap: () => controller.toggle('expense'),
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
                              onTap: () => controller.toggle('income'),
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
                              onTap: () => controller.togglepage(0, 'Q1'),
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
                              onTap: () => controller.togglepage(1, 'Q2'),
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
                              onTap: () => controller.togglepage(2, 'Q3'),
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
                              onTap: () => controller.togglepage(3, 'Q4'),
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
                      SizedBox(height: Get.height * 0.05),
                      Container(
                        height: Get.height * 0.25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffEDF1F3),
                        ),
                        child: Obx(() => controller.monthlyDataList.isEmpty?Center(child: Text('No Data Available')):BarChart(
                          BarChartData(
                            borderData: FlBorderData(show: false),
                            backgroundColor: Colors.white,
                            alignment: BarChartAlignment.spaceAround,
                            maxY:
                                controller.monthlyDataList
                                    .map((e) => e.value)
                                    .reduce((a, b) => a > b ? a : b) +
                                10,

                            // ✅ ADD THIS — tooltip customization
                            barTouchData: BarTouchData(
                              enabled: true,
                              touchTooltipData: BarTouchTooltipData(
                                getTooltipColor: (group) =>
                                    Color(0xff62636C), // dark background
                                // tooltipRoundedRadius: 10,
                                tooltipPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                  final data =
                                      controller.monthlyDataList[group.x];
                                  return BarTooltipItem(
                                    // Line 1 — Quarter label
                                    '${data.quarter}: ${data.quarterLabel}\n',
                                    GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(0xffFFFFFF),
                                    ),
                                    children: [
                                      // Line 2 — Category
                                      TextSpan(
                                        text: '${data.category}\n',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                      // Line 3 — Value + percent (customize as needed)
                                      TextSpan(
                                        text:
                                            '\$${data.value.toInt()}:${data.quarter}',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),

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
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                          ),
                        ),)
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.businessdata.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: Get.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      controller.businessdata[index].tittle,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xff1E1E1E),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    Text(
                                      '\$${controller.businessdata[index].lastmonthIncome.toString()}',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xff1E1E1E),
                                      ),
                                    ),
                                    Text(
                                      'last quarter',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '\$${controller.businessdata[index].thismonthIncome}',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Color(0xff0F3D2E),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    Row(
                                      children: [
                                        Image.asset(
                                          controller.businessdata[index].profit
                                              ? AppImages.profit
                                              : AppImages.loss,
                                          height: Get.height * 0.02,
                                        ),
                                        Text(
                                          '${controller.businessdata[index].profilorlosspercent}%',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: controller.businessdata[index].profit?AppImages.greencolor:Color(0xffC84B4B),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'VS last quarter',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height*0.5,)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
