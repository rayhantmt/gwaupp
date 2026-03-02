import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class OtpPageView extends GetView<OtpPageController> {
  const OtpPageView({super.key});

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
            Image.asset(AppImages.backIcon, height: Get.height * 0.06),
            SizedBox(height: Get.height * 0.05),
            Container(
              height: Get.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                children: [
                  const Text(
                    "Verify your email",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff050505),
                    ),
                  ),
                  const SizedBox(height: 12),

                  const SizedBox(height: 4),
                  Text(
                    "Please enter the verification code we sent to your email address to complete the verification process.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff595959),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: Get.width*0.11,
                        height: Get.height*0.07,
                        child: TextField(
                          controller: controller.otpControllers[index],
                          focusNode: controller.otpFocusNodes[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),

                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            controller.onOtpFieldChanged(value, index);
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Did not get code?',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff62636C),
                        ),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: controller.secondsRemaining.value == 0
                              ? controller.resendCode
                              : null,
                          child: Text(
                            controller.secondsRemaining.value == 0
                                ? "Resend"
                                : "Resend in${controller.secondsRemaining}s",
                            style: TextStyle(
                              color: controller.secondsRemaining.value == 0
                                  ? const Color(0xff0F3D2E)
                                  : const Color(0xff0F3D2E),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height*0.35,),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.createyourprofile),
              child: CommonButton(tittle: 'Verify OTP'))
          ],
        ),
      ),
    );
  }
}
