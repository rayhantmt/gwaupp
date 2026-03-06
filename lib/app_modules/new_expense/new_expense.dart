import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/app_modules/main_screen/main_screen_controller.dart';
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
    // Use addPostFrameCallback to trigger the modal after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showExpenseModal(context);
    });
  }

  void _showExpenseModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Good for Momentum's clean UI
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: const Center(child: Text("Add New Expense")),
      ),
    ).then((_) {
      final conroller=Get.find<MainScreenController>();
      conroller.pagetype.value=0;
      // Navigate back when modal is dismissed so the user isn't stuck on a blank screen
      // if (mounted) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty SizedBox so nothing is rendered behind the modal
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.shrink(),
    );
  }
}
