import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';
import 'package:gwaupp/utils/app_images.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Stack(
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
                                borderRadius: BorderRadius.circular(100),
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
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                AppImages.profileImage,
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
                        Text(
                          'Jmaes Walker',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.white,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          '\$1,200',
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
                                      '29.56%',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xff6BB498),
                                      ),
                                    ),
                                    SizedBox(width: Get.width * 0.07),
                                    Container(
                                      height: Get.height * 0.04,
                                      width: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffC9A24D),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Feb 2026',
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffC9A24D),
                                                fontSize: 14,
                                              ),
                                            ),
                                            Image.asset(AppImages.arrowdown),
                                          ],
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
                                          '\$3,450',
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppImages.arrowdowncontainer,
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              'Income',
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0xff6BB498),
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
                                          '41.32%',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xff6BB498),
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.05),
                                        Column(
                                          children: [
                                            Text(
                                              '\$3,450',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Expense',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: Color(0xff6BB498),
                                                  ),
                                                ),
                                                Image.asset(
                                                  AppImages.arrowupcontainer,
                                                  height: Get.height * 0.03,
                                                ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(AppImages.target,
                              height: Get.height*0.03,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.03,),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
