import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/app_modules/home_screen/home_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';


Future<void> openMonthYearPicker(HomeScreenController controller) async {
  await Get.bottomSheet(
    _MonthYearPickerSheet(controller: controller),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
  );
}

class _MonthYearPickerSheet extends StatelessWidget {
  final HomeScreenController controller;
  const _MonthYearPickerSheet({required this.controller});

  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr',
    'May', 'Jun', 'Jul', 'Aug',
    'Sep', 'Oct', 'Nov', 'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: const BoxDecoration(
          color: AppImages.greencolor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              'Select Month & Year',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 20),

            // Year row
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => controller.selectedYear.value--,
                  icon: const Icon(Icons.chevron_left, color: Color(0xffC9A24D), size: 26),
                ),
                Text(
                  '${controller.selectedYear.value}',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () => controller.selectedYear.value++,
                  icon: const Icon(Icons.chevron_right, color: Color(0xffC9A24D), size: 26),
                ),
              ],
            )),

            const SizedBox(height: 14),

            // Month grid — uses LayoutBuilder to fill exactly the sheet width
            LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = (constraints.maxWidth - 30) / 4; // 3 gaps of 10
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(12, (index) {
                    return Obx(() {
                      final isSelected = controller.selectedMonth.value == index + 1;
                      return GestureDetector(
                        onTap: () {
                          controller.onDateSelected(
                            index + 1,
                            controller.selectedYear.value,
                          );
                          Get.back();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          width: itemWidth,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected
                                ? const Color(0xffC9A24D)
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xffC9A24D)
                                  : Colors.white12,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _months[index],
                            style: GoogleFonts.inter(
                              color: isSelected ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      );
                    });
                  }),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}