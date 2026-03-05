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
                        Text('Good morning',
                        style: GoogleFonts.inter( 
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white
                        ),
                        ),
                        Text('Jmaes Walker',
                        style: GoogleFonts.montserrat( 
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white
                        ),
                        ),
                        SizedBox(height: Get.height*0.03,),
                        Container(
                          height: Get.height*0.2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 12,
                                color: Color(0xff75B5A0)
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff0F3D2E)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppImages.netsavingslogo,
                                    height: Get.height*0.04,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
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
