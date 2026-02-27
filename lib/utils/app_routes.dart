import 'package:get/route_manager.dart';
import 'package:gwaupp/app_modules/log_in/log_in_view.dart';
import 'package:gwaupp/utils/app_pages.dart';

class AppRoutes {
  static final pages=[
    GetPage(name: AppPages.login, page: () => LogInView(),)
  ];
}