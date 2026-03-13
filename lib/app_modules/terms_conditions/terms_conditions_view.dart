import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/utils/app_images.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

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
                    style: GoogleFonts.inter(fontSize: 14, color: Color(0xff2B2B2B), height: 1.6),
                    children: [
          // Effective Date
          TextSpan(text: 'Effective Date: 2/22/2026\n\n'),
                  
          // Intro
          TextSpan(text: 'Welcome to GWAUPP.\n', style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xff2B2B2B))),
          TextSpan(text: 'By using this app, you agree to the terms below. We\'ve written them in plain language so they\'re easy to understand.\n\n'),
                  
          // Section 1
          TextSpan(text: '1. What GWAUPP Is\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'GWAUPP is a personal finance tracking and awareness app.\n'),
          TextSpan(text: 'It helps you manually track income, expenses, savings, debt, and financial goals so you can better understand your money.\n\n'),
          TextSpan(text: 'GWAUPP is an educational and informational tool.\n'),
          TextSpan(text: 'It is not a bank, lender, investment advisor, tax advisor, or financial planner.\n\n'),
                  
          // Section 2
          TextSpan(text: '2. Your Responsibility\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'You are responsible for:\n'),
          TextSpan(text: '• Entering accurate information\n• Keeping your login credentials secure\n• Reviewing your subscription details\n• Using the app in a lawful and respectful way\n\n'),
          TextSpan(text: 'The insights provided by GWAUPP are based entirely on the data you enter.\n\n'),
                  
          // Section 3
          TextSpan(text: '3. Subscriptions & Billing\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'GWAUPP offers:\n'),
          TextSpan(text: '• A 15-day free trial\n• A monthly subscription\n• An annual subscription (discounted)\n\n'),
          TextSpan(text: 'Subscriptions automatically renew unless canceled before the renewal date.\n'),
          TextSpan(text: 'Billing is processed through Apple App Store or Google Play Store.\n'),
          TextSpan(text: 'We do not store your payment information.\n'),
          TextSpan(text: 'If you cancel, you will retain access until the end of your billing period.\n'),
          TextSpan(text: 'Refunds are handled according to Apple or Google policies.\n\n'),
                  
          // Section 4
          TextSpan(text: '4. Financial Decisions\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'GWAUPP provides tracking tools and educational content.\n'),
          TextSpan(text: 'We do not provide financial, legal, tax, or investment advice.\n'),
          TextSpan(text: 'Any financial decisions you make are your responsibility.\n'),
          TextSpan(text: 'If you need professional advice, consult a licensed professional.\n\n'),
                  
          // Section 5
          TextSpan(text: '5. Data & Privacy\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'Your privacy matters to us.\nYour financial information is:\n'),
          TextSpan(text: '• Entered manually by you\n• Stored securely\n• Never sold\n\n'),
          TextSpan(text: 'Please review our Privacy Policy for more details.\n\n'),
                  
          // Section 6
          TextSpan(text: '6. Account Suspension or Termination\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'We may suspend or terminate accounts that:\n'),
          TextSpan(text: '• Violate these terms\n• Attempt to misuse the platform\n• Engage in fraudulent activity\n\n'),
          TextSpan(text: 'You may delete your account at any time.\n\n'),
                  
          // Section 7
          TextSpan(text: '7. Changes to the App or Terms\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'We may update features, pricing, or these terms as the app grows.\n'),
          TextSpan(text: 'If significant changes occur, we will notify users within the app.\n'),
          TextSpan(text: 'Continued use of GWAUPP after updates means you accept the revised terms.\n\n'),
                  
          // Section 8
          TextSpan(text: '8. Limitation of Liability\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'We work hard to provide a reliable app, but:\n'),
          TextSpan(text: '• We cannot guarantee uninterrupted service\n• We are not responsible for financial losses resulting from user decisions\n• We are not liable for technical issues outside our control\n\n'),
          TextSpan(text: 'Use of the app is at your own discretion.\n\n'),
                  
          // Section 9
          TextSpan(text: '9. Contact\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'If you have questions about these Terms:\n'),
          TextSpan(text: 'Email: ', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Color(0xff2B2B2B))),
          TextSpan(text: 'info@gwaupp.com\n\n'),
                  
          // Final Word
          TextSpan(text: 'A Final Word\n', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xff1E1E1E))),
          TextSpan(text: 'GWAUPP exists to help you build awareness, discipline, and confidence with your money.\n'),
          TextSpan(text: 'We\'re here to provide clarity — not complexity.\n\n'),
          TextSpan(text: 'Thank you for being part of the journey.', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Color(0xff2B2B2B))),
                    ],
                  ),
          ),
        )
            ),
          ],
        ),
      ),
    );
  }
}