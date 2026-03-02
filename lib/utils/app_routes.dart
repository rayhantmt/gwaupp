import 'package:get/route_manager.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_binding.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_view.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_binding.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_view.dart';
import 'package:gwaupp/app_modules/log_in/log_in_binding.dart';
import 'package:gwaupp/app_modules/log_in/log_in_view.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_binding.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_view.dart';
import 'package:gwaupp/utils/app_pages.dart';

class AppRoutes {
  static final pages=[
    GetPage(name: AppPages.login, page: () => LogInView(),binding: LogInBinding()),
    GetPage(name: AppPages.createnewaccount, page: () => CreateNewAccountView(),binding: CreateNewAccountBinding()),
    GetPage(name: AppPages.otppage, page: () => OtpPageView(),binding: OtpPageBinding()),
    GetPage(name: AppPages.createyourprofile, page: () => CreateYourProfileView(),binding: CreateYourProfileBinding()),
  ];
}