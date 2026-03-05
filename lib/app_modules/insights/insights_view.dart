import 'package:flutter/material.dart';
import 'package:gwaupp/utils/app_images.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Column(
        children: [
          Text('Insifht')
        ],
      ),
    );
  }
}