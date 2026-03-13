import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/utils/app_images.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff1E1E1E))),
                SizedBox(width: Get.width * 0.05),
                Text(
                  'Privacy Policy',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff2B2B2B),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Image.asset(AppImages.privacybanner,
            height: Get.height*0.08,
            fit: BoxFit.cover,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff2B2B2B),
                      height: 1.6,
                    ),
                    children: [
                      // Effective Date
                      TextSpan(text: 'Effective Date: 2/22/2026\n\n'),
                              
                      // Intro
                      TextSpan(
                        text:
                            'We believe financial clarity should feel safe.\nHere\'s how we protect your information.\n\n',
                      ),
                              
                      // Section 1
                      TextSpan(
                        text: '1. What We Collect\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(
                        text: 'We collect only what we need to run the app.\n\n',
                      ),
                      TextSpan(
                        text: 'When you create an account:\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2B2B2B),
                        ),
                      ),
                      TextSpan(
                        text:
                            '• Your name\n• Your email address\n• Your login details\n\n',
                      ),
                      TextSpan(
                        text: 'When you use the app:\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2B2B2B),
                        ),
                      ),
                      TextSpan(
                        text:
                            '• The financial information you manually enter (income, expenses, goals, debts, savings)\n\n',
                      ),
                      TextSpan(
                        text: 'For subscriptions:\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2B2B2B),
                        ),
                      ),
                      TextSpan(
                        text: '• Subscription status (monthly or annual)\n\n',
                      ),
                      TextSpan(
                        text:
                            'We do not store your credit card information. Payments are securely handled by Apple or Google.\n\n',
                      ),
                              
                      // Section 2
                      TextSpan(
                        text: '2. What We Do With Your Information\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(text: 'We use your information to:\n'),
                      TextSpan(
                        text:
                            '• Run the app properly\n• Show your financial insights\n• Improve performance\n• Send important account updates\n• Provide customer support\n\n',
                      ),
                      TextSpan(
                        text:
                            'We do not sell your personal data.\nWe do not sell your financial data.\nWe do not share your data for advertising.\n\n',
                      ),
                              
                      // Section 3
                      TextSpan(
                        text: '3. Your Financial Data\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(text: 'Everything you enter into GWAUPP:\n'),
                      TextSpan(
                        text:
                            '• Is entered by you\n• Is stored securely\n• Is used only to provide your reports and insights\n\n',
                      ),
                      TextSpan(
                        text:
                            'We do not connect to your bank accounts.\nWe do not automatically pull your transactions.\nYou are in control of what gets entered.\n\n',
                      ),
                              
                      // Section 4
                      TextSpan(
                        text: '4. How We Protect Your Data\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(
                        text:
                            'We use industry-standard security measures, including:\n',
                      ),
                      TextSpan(
                        text:
                            '• Encrypted storage\n• Secure login systems\n• Limited internal access\n\n',
                      ),
                      TextSpan(
                        text:
                            'While no system is perfect, protecting your data is a priority.\n\n',
                      ),
                              
                      // Section 5
                      TextSpan(
                        text: '5. If You Cancel\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(text: 'If you cancel your subscription:\n'),
                      TextSpan(
                        text:
                            '• You keep access until your billing period ends\n• Your data is stored for up to 90 days\n• You may request permanent deletion at any time\n\n',
                      ),
                      TextSpan(
                        text:
                            'After the retention period, your data may be permanently removed.\n\n',
                      ),
                              
                      // Section 6
                      TextSpan(
                        text: '6. Your Choices\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(text: 'You can:\n'),
                      TextSpan(
                        text:
                            '• Update your information\n• Cancel your subscription anytime\n• Request account deletion\n• Contact us with privacy questions\n\n',
                      ),
                      TextSpan(
                        text: 'Email: ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2B2B2B),
                        ),
                      ),
                      TextSpan(text: 'info@gwaupp.com\n\n'),
                              
                      // Section 7
                      TextSpan(
                        text: '7. One Simple Promise\n',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      TextSpan(
                        text:
                            'GWAUPP exists to help you understand your money — not to profit from your data.\n\n',
                      ),
                      TextSpan(
                        text: 'Your trust matters.',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2B2B2B),
                        ),
                      ),
                    ],
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
