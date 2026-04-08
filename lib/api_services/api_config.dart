class ApiConfig {
  static const String baseUrl='https://api.gwaupp.com';
  static const String signupurl='/api/v1/auth/create-account';
  static const String verifyotp='/api/v1/auth/verify-otp';
  static const String loginendpoint='/api/v1/auth/login';
  static const String sendotp='/api/v1/auth/send-otp';
  static const String forgotpassotp='/api/v1/auth/reset-password';
  static const String changeemail='/api/v1/auth/email-change-otp';
  static const String confirmchangeemail='/api/v1/auth/change-email';
  static const String getincomecategories='/api/v1/category/get-my-category?type=income';
   static const String getexpensecategories='/api/v1/category/get-my-category?type=expense';
  static const String addnewcategory='/api/v1/category/create-category';
  static const String deletecategory ='/api/v1/category/delete-my-category/';
  static const String addexpenseorincome='/api/v1/in_ex/create-in_ex';
  static const String getincome='/api/v1/in_ex/get-my-in_ex?type=income';
  static const String getexpense='/api/v1/in_ex/get-my-in_ex?type=expense';
}