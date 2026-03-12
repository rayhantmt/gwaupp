import 'package:get/route_manager.dart';
import 'package:gwaupp/app_modules/add_income/add_income_binding.dart';
import 'package:gwaupp/app_modules/add_income/add_income_view.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_binding.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_view.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_binding.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_view.dart';
import 'package:gwaupp/app_modules/forgot_password/forgot_password_binding.dart';
import 'package:gwaupp/app_modules/forgot_password/forgot_password_view.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_binding.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_view.dart';
import 'package:gwaupp/app_modules/income_history/income_history_binding.dart';
import 'package:gwaupp/app_modules/income_history/income_history_view.dart';
import 'package:gwaupp/app_modules/log_in/log_in_binding.dart';
import 'package:gwaupp/app_modules/log_in/log_in_view.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_binding.dart';
import 'package:gwaupp/app_modules/my_profile/my_profile_binding.dart';
import 'package:gwaupp/app_modules/my_profile/my_profile_view.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_binding.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_view.dart';
import 'package:gwaupp/app_modules/select_category/select_category_bindings.dart';
import 'package:gwaupp/app_modules/select_category/select_category_view.dart';
import 'package:gwaupp/app_modules/update_password/update_password_binding.dart';
import 'package:gwaupp/app_modules/update_password/update_password_view.dart';
import 'package:gwaupp/app_modules/verify_otp_forgotpass/verify_otp_forgotpass_binding.dart';
import 'package:gwaupp/app_modules/verify_otp_forgotpass/verify_otp_forgotpass_view.dart';
import 'package:gwaupp/utils/app_pages.dart';

class AppRoutes {
  static final pages=[
    GetPage(name: AppPages.login, page: () => LogInView(),binding: LogInBinding()),
    GetPage(name: AppPages.createnewaccount, page: () => CreateNewAccountView(),binding: CreateNewAccountBinding()),
    GetPage(name: AppPages.otppage, page: () => OtpPageView(),binding: OtpPageBinding()),
    GetPage(name: AppPages.createyourprofile, page: () => CreateYourProfileView(),binding: CreateYourProfileBinding()),
    GetPage(name: AppPages.forgotpassword, page: () => ForgotPasswordView(),binding: ForgotPasswordBinding()),
    GetPage(name: AppPages.verifyotpforgotpass, page: () => VerifyOtpForgotpassView(),binding: VerifyOtpForgotpassBinding()),
    GetPage(name: AppPages.updatepassword, page: () => UpdatePasswordView(),binding: UpdatePasswordBinding()),
    GetPage(name: AppPages.homescreen, page: () => HomeScreenView(),binding: HomeScreenBinding()),
    GetPage(name: AppPages.mainscreen, page: () => MainScreenView(),binding: MainScreenBinding()),
    GetPage(name: AppPages.myprofile, page: () => MyProfileView(),binding: MyProfileBinding()),
    GetPage(name: AppPages.incomeHistory, page: () => IncomeHistoryView(),binding: IncomeHistoryBinding()),
    GetPage(name: AppPages.addincome, page: () => AddIncomeView(),binding: AddIncomeBinding()),
    GetPage(name: AppPages.selectcategory, page:  () => SelectCategoryView(),binding: SelectCategoryBindings())

  ];
}