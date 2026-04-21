import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_controller.dart';
import 'package:gwaupp/common_widgets/date_filter_picker.dart';
import 'package:gwaupp/global_services/global_services.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final serviecController = Get.find<GlobalServicesController>();
    final con = Get.find<MainScreenController>();
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(color: AppImages.greencolor),
              )
            : Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Image.asset(AppImages.homebanner)],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.42,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0xff0F3D2E),
                                Color(0xff195D47),
                                Color(0xffFFFFFF),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Get.height * 0.07),
                                Row(
                                  children: [
                                    Text(
                                      'GWAUPP',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Color(0xffC9A24D),
                                      ),
                                    ),
                                    // SizedBox(width: Get.width*0.03,),
                                    Expanded(child: SizedBox()),
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xff317B62),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Free',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: Get.width * 0.03),
                                    Image.asset(AppImages.notificationIcon),
                                    SizedBox(width: Get.width * 0.03),
                                    GestureDetector(
                                      onTap: () =>
                                          Get.toNamed(AppPages.myprofile),
                                      child: Obx(
                                        () => CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            (serviecController
                                                            .profileimg
                                                            .value ==
                                                        null ||
                                                    serviecController
                                                        .profileimg
                                                        .value!
                                                        .isEmpty)
                                                ? AppImages.noprofileimage
                                                : serviecController
                                                      .profileimg
                                                      .value!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Good morning',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    //'Jmaes Walker',
                                    "${serviecController.firstName} ${serviecController.lastName}",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.03),
                                Container(
                                  height: Get.height * 0.2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12,
                                        color: Color(0xff75B5A0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff0F3D2E),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppImages.netsavingslogo,
                                              height: Get.height * 0.04,
                                            ),
                                            SizedBox(width: Get.width * 0.03),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '\$${controller.netSavingsAmount.toString()}',
                                                  style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Net Savings',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: Color(0xff6BB498),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: Get.width * 0.03),
                                            Text(
                                              controller.netSavingsChangePercent
                                                  .toString(),
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Color(0xff6BB498),
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.06),
                                            Obx(
                                              () => GestureDetector(
                                                onTap: () =>
                                                    openMonthYearPicker(
                                                      controller,
                                                    ),
                                                child: Container(
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.25,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                        0xffC9A24D,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                        ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          controller
                                                              .displayLabel
                                                              .value, // ← reactive label
                                                          style:
                                                              GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    const Color(
                                                                      0xffC9A24D,
                                                                    ),
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                        Image.asset(
                                                          AppImages.arrowdown,
                                                          height:
                                                              Get.height * 0.02,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.03),
                                        Divider(
                                          height: 1,
                                          endIndent: 1,
                                          indent: 1,
                                          color: Color(0xff245040),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '\$${controller.incomeAmount.toString()}',
                                                  style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    // Image.asset(
                                                    //   AppImages.arrowdowncontainer,
                                                    //   height: Get.height * 0.03,
                                                    // ),
                                                    Text(
                                                      'Income',
                                                      style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xff6BB498,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: Get.width * 0.03),
                                            Image.asset(
                                              AppImages.divider,
                                              height: Get.height * 0.04,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${controller.expenseChangePercent}%',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Color(0xff6BB498),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.05,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '\$${controller.expenseAmount.toString()}',
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Expense',
                                                          style:
                                                              GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                color: Color(
                                                                  0xff6BB498,
                                                                ),
                                                              ),
                                                        ),
                                                        // Image.asset(
                                                        //   AppImages.arrowupcontainer,
                                                        //   height: Get.height * 0.03,
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: Get.height * 0.16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12,
                                  color: Color(0xff000000).withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppImages.expenseprogress,
                                        height: Get.height * 0.03,
                                      ),
                                      Text(
                                        'Expense progress',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Spent',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${controller.expenseChangePercent.value.toString()}%',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: Get.height * 0.02,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xffE6E6E3),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: Get.height * 0.02,
                                          width:
                                              Get.width *
                                              controller
                                                  .expenseChangePercent
                                                  .value /
                                              100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                            color:
                                                controller
                                                        .expenseChangePercent
                                                        .value >
                                                    70
                                                ? const Color(0xffE63939)
                                                : controller
                                                          .expenseChangePercent
                                                          .value >
                                                      40
                                                ? const Color(0xffE3A008)
                                                : const Color(0xff317B62),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Low',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                      Text(
                                        'Medium',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                      Text(
                                        'High',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: Get.height * 0.16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12,
                                  color: Color(0xff000000).withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppImages.yelloicon,
                                        height: Get.height * 0.03,
                                      ),
                                      Text(
                                        'Top Spendig category',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        controller.topCategory.toString(),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        controller.topCategoryAmount.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: Color(0xff0F3D2E),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      con.pagetype.value = 2;
                                    },
                                    child: Image.asset(AppImages.viewbreakdown),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: Get.height * 0.05),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Image.asset(AppImages.income,
                              // height: Get.height*0.05,
                              //),
                              GestureDetector(
                                onTap: () =>
                                    Get.toNamed(AppPages.incomeHistory),
                                child: Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xff0F3D2E),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Income',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Get.toNamed(AppPages.expensehistory),
                                child: Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xff0F3D2E),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Expenses',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.2),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
