import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_controller.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class NewExpenseView extends StatefulWidget {
  const NewExpenseView({super.key});
  @override
  State<NewExpenseView> createState() => _NewExpenseViewState();
}

class _NewExpenseViewState extends State<NewExpenseView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showExpenseModal(context);
    });
  }

  void _showExpenseModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      builder: (context) => Container(
        height: Get.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.addexpense),
                child: Image.asset(AppImages.addexpense)),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.addincome),
                child: Image.asset(AppImages.addincome))
            ],
          ),
        )
      ),
    ).then((_) {
      final conroller=Get.find<MainScreenController>();
      conroller.pagetype.value=0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      //backgroundColor: Colors.transparent,
      body: Image.asset(AppImages.splashScreen,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      ),
    );
  }
}
