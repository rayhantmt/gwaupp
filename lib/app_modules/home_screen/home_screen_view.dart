import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';
import 'package:gwaupp/utils/app_images.dart';

class  HomeScreenView extends GetView<HomeScreenController> {
  const  HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
    );
  }
}