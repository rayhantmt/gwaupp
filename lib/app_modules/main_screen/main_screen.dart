import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_view.dart';
import 'package:gwaupp/app_modules/insights/insights_view.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_controller.dart';
import 'package:gwaupp/app_modules/new_expense/new_expense.dart';
import 'package:gwaupp/utils/app_images.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (controller.pagetype.value == 0) {
              return HomeScreenView();
            } else if (controller.pagetype.value == 1) {
              return NewExpenseView();
            } else {
              return InsightsView();
            }
          }),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  //color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  // border: Border.all(width: 0.5, color: Color(0xff6C6E79)),
                ),
                height: Get.height * 0.15,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.unionbottom,
                      height: Get.height * 0.15,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => controller.setpagetype(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.homeicon,
                                height: Get.height * 0.035,
                                color: controller.pagetype.value == 0
                                    ? Color(0xff0F3D2E)
                                    : Color(0xff6B6B6B),
                              ),
                              Text(
                                'Home',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w500,
                                  color: controller.pagetype.value == 0
                                      ? Color(0xff0F3D2E)
                                    : Color(0xff6B6B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Get.width*0.033,),
                        GestureDetector(
                          onTap: () => controller.setpagetype(1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   AppImages.newexpense,
                    
                              //   height: Get.height * 0.035,
                              //   color: controller.pagetype.value == 1
                              //       ? Color(0xff0F3D2E)
                              //       : Color(0xff0F3D2E),
                              // ),
                              CircleAvatar(
                                radius: Get.height*0.03,
                                backgroundColor: Color(0xff0F3D2E),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                              SizedBox(height: Get.height * 0.05),
                            ],
                          ),
                        ),
                           SizedBox(width: Get.width*0.001,),
                        GestureDetector(
                          onTap: () => controller.setpagetype(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.insightsicon,
                                height: Get.height * 0.035,
                                color: controller.pagetype.value == 2
                                   ? Color(0xff0F3D2E)
                                    : Color(0xff6B6B6B),
                              ),
                              Text(
                                'Insights',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w500,
                                  color: controller.pagetype.value == 2
                                      ? Color(0xff0F3D2E)
                                    : Color(0xff6B6B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
