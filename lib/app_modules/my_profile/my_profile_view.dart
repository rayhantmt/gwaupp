import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/common_widgets/profile_container.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

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
                  child: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: Get.width * 0.05),
                Text(
                  'My Profile',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.personalDetails),
              child: Container(
                height: Get.height * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(AppImages.profileImage),
                      ),
                      SizedBox(width: Get.width * 0.05),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Adam Smith',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          Text(
                            'adam_s854',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xff6B6B6B),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'More Tools',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff6B6B6B),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(AppPages.incomecategory),
                    child: ProfileContainer(
                      tittle: 'Income Category',
                      img: AppImages.incomeCategory,
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffE6E6E3),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppPages.expnesecategory),
                    child: ProfileContainer(
                      tittle: 'Expense Category',
                      img: AppImages.incomeCategory,
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffE6E6E3),
                  ),
                  ProfileContainer(
                    tittle: 'Subscription',
                    img: AppImages.subscriptions,
                  ),
                  Divider(
                    height: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffE6E6E3),
                  ),
                  ProfileContainer(
                    tittle: 'Payment History',
                    img: AppImages.payment,
                  ),
                  Divider(
                    height: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffE6E6E3),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppPages.changePassword),
                    child: ProfileContainer(
                      tittle: 'Change Your Password',
                      img: AppImages.changePassword,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'More Info & Support',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff6B6B6B),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFFFFFF),
              ),
              child: ProfileContainer(
                tittle: 'Rate this App',
                img: AppImages.rateTheapp,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Others',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff6B6B6B),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(AppPages.privacyPolicy),
                    child: ProfileContainer(
                      tittle: 'GWAUPP Privacy',
                      img: AppImages.privacy,
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffE6E6E3),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppPages.termsandconditions),
                    child: ProfileContainer(
                      tittle: 'GWAUPP Terms of Service',
                      img: AppImages.privacy,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Image.asset(AppImages.signout),
          ],
        ),
      ),
    );
  }
}
