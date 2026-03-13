import 'package:get/route_manager.dart';
import 'package:gwaupp/app_modules/add_expense/add_expense_binding.dart';
import 'package:gwaupp/app_modules/add_expense/add_expense_view.dart';
import 'package:gwaupp/app_modules/change_email/change_email_binding.dart';
import 'package:gwaupp/app_modules/change_email/change_email_view.dart';
import 'package:gwaupp/app_modules/add_income/add_income_binding.dart';
import 'package:gwaupp/app_modules/add_income/add_income_view.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_binding.dart';
import 'package:gwaupp/app_modules/create_new_account/create_new_account_view.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_binding.dart';
import 'package:gwaupp/app_modules/create_your_profile/create_your_profile_view.dart';
import 'package:gwaupp/app_modules/expense_history/expense_history_binding.dart';
import 'package:gwaupp/app_modules/expense_history/expense_history_view.dart';
import 'package:gwaupp/app_modules/expnese_category/expense_category_binding.dart';
import 'package:gwaupp/app_modules/expnese_category/expense_category_view.dart';
import 'package:gwaupp/app_modules/forgot_password/forgot_password_binding.dart';
import 'package:gwaupp/app_modules/forgot_password/forgot_password_view.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_binding.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_view.dart';
import 'package:gwaupp/app_modules/income_history/income_history_binding.dart';
import 'package:gwaupp/app_modules/income_history/income_history_view.dart';
import 'package:gwaupp/app_modules/incone_category/income_category_binding.dart';
import 'package:gwaupp/app_modules/incone_category/income_category_view.dart';
import 'package:gwaupp/app_modules/log_in/log_in_binding.dart';
import 'package:gwaupp/app_modules/log_in/log_in_view.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_binding.dart';
import 'package:gwaupp/app_modules/my_profile/my_profile_binding.dart';
import 'package:gwaupp/app_modules/my_profile/my_profile_view.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_binding.dart';
import 'package:gwaupp/app_modules/otp_page/otp_page_view.dart';
import 'package:gwaupp/app_modules/otp_verification_email/otp_verification_email_binding.dart';
import 'package:gwaupp/app_modules/otp_verification_email/otp_verification_email_view.dart';
import 'package:gwaupp/app_modules/personal_details/personal_details_binding.dart';
import 'package:gwaupp/app_modules/personal_details/personal_details_view.dart';
import 'package:gwaupp/app_modules/select_category_expense/select_category_expense_binding.dart';
import 'package:gwaupp/app_modules/select_category_expense/select_category_expense_view.dart';
import 'package:gwaupp/app_modules/select_category_income/select_category_bindings.dart';
import 'package:gwaupp/app_modules/select_category_income/select_category_view.dart';
import 'package:gwaupp/app_modules/update_password/update_password_binding.dart';
import 'package:gwaupp/app_modules/update_password/update_password_view.dart';
import 'package:gwaupp/app_modules/verify_otp_forgotpass/verify_otp_forgotpass_binding.dart';
import 'package:gwaupp/app_modules/verify_otp_forgotpass/verify_otp_forgotpass_view.dart';
import 'package:gwaupp/utils/app_pages.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppPages.login,
      page: () => LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: AppPages.createnewaccount,
      page: () => CreateNewAccountView(),
      binding: CreateNewAccountBinding(),
    ),
    GetPage(
      name: AppPages.otppage,
      page: () => OtpPageView(),
      binding: OtpPageBinding(),
    ),
    GetPage(
      name: AppPages.createyourprofile,
      page: () => CreateYourProfileView(),
      binding: CreateYourProfileBinding(),
    ),
    GetPage(
      name: AppPages.forgotpassword,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppPages.verifyotpforgotpass,
      page: () => VerifyOtpForgotpassView(),
      binding: VerifyOtpForgotpassBinding(),
    ),
    GetPage(
      name: AppPages.updatepassword,
      page: () => UpdatePasswordView(),
      binding: UpdatePasswordBinding(),
    ),
    GetPage(
      name: AppPages.homescreen,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppPages.mainscreen,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: AppPages.myprofile,
      page: () => MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: AppPages.incomeHistory,
      page: () => IncomeHistoryView(),
      binding: IncomeHistoryBinding(),
    ),
    GetPage(
      name: AppPages.addincome,
      page: () => AddIncomeView(),
      binding: AddIncomeBinding(),
    ),
    GetPage(
      name: AppPages.selectcategory,
      page: () => SelectCategoryView(),
      binding: SelectCategoryBindings(),
    ),
    GetPage(
      name: AppPages.incomecategory,
      page: () => IncomeCategoryView(),
      binding: IncomeCategoryBinding(),
    ),
    GetPage(
      name: AppPages.expnesecategory,
      page: () => ExpenseCategoryView(),
      binding: ExpenseCategoryBinding(),
    ),
    GetPage(
      name: AppPages.expensehistory,
      page: () => ExpenseHistoryView(),
      binding: ExpenseHistoryBinding(),
    ),
    GetPage(
      name: AppPages.addexpense,
      page: () => AddExpenseView(),
      binding: AddExpenseBinding(),
    ),
    GetPage(
      name: AppPages.selectcatrgoryexpense,
      page: () => SelectCategoryExpenseView(),
      binding: SelectCategoryExpenseBinding(),
    ),
    GetPage(
      name: AppPages.personalDetails,
      page: () => PersonalDetailsView(),
      binding: PersonalDetailsBinding(),
    ),
    GetPage(name: AppPages.changeEmail, page:()=> ChangeEmailView(),binding: ChangeEmailBinding()),
    GetPage(name: AppPages.otpverificationemail, page: () => OtpVerificationEmailView(),binding: OtpVerificationEmailBinding())
  ];
}
