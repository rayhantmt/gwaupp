import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/add_income/add_income_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class AddIncomeView extends GetView<AddIncomeController> {
  const AddIncomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                SizedBox(width: Get.width * 0.08),
                Text(
                  'Add Income',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.04),
            Text(
              'Date & Time',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff1E1E1E),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedStart = await showDatePicker(
                      context: context,
                      initialDate: controller.startDate.value ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(3000),
                      helpText: 'Select date',
                    );
                    if (pickedStart == null) return;
                    controller.startDate.value = pickedStart;
                  },
                  child: Obx(
                    () => Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Color(0xffE6E6E3)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xff6B6B6B),
                            ),
                            Text(controller.formattedDateRange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? pickedStart = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedStart == null) return;
                    controller.startTime.value = pickedStart;
                  },
                  child: Obx(
                    () => Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Color(0xffE6E6E3)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xff6B6B6B),
                          ),
                          Text(controller.formattedStartTime),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Category',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff1E1E1E),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.selectcategory),
              child: Container(
                height: Get.height * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Color(0xffD8D9E0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.incomeCategory,
                        color: Color(0xff6B6B6B),
                        height: Get.height * 0.035,
                      ),
                      SizedBox(width: Get.width * 0.05),
                      Text(
                        'Select a category',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B6B6B),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xff6B6B6B),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Obx(() {
              final selected = controller.selectedMethod.value;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _MethodChip(label: 'Cash', icon: Icons.money, index: 0),
                      SizedBox(width: 8),
                      _MethodChip(
                        label: 'Credit',
                        icon: Icons.credit_card,
                        index: 1,
                      ),
                      SizedBox(width: 8),
                      _MethodChip(
                        label: 'Bank',
                        icon: Icons.account_balance,
                        index: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  IndexedStack(
                    index: selected,
                    children: [CashContent(), CreditContent(), BankContent()],
                  ),
                ],
              );
            }),
            Container(
              height: Get.height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Color(0xffD8D9E0)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.enteramount,
                          color: Color(0xff6B6B6B),
                          height: Get.height * 0.035,
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Text(
                          'Enter amount',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff6B6B6B),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff6B6B6B),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Note',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff1E1E1E),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * .15,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Color(0xffD8D9E0)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                  hint: Text(
                    'Enter comment',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Repeat this transaction',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Obx(
                  () => Switch(
                    //activeColor: Color(0xffFFFFFF),
                    focusColor: Color(0xffFFFFFF),
                    activeThumbColor: Color(0xff0F3D2E),
                    value: controller.repeatedTrans.value,
                    onChanged: (value) => controller.togglerepeated(value),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.05,),
            CommonButton(tittle: 'Add Income')
          ],
        ),
      ),
    );
  }
}

class _MethodChip extends GetView<AddIncomeController> {
  final String label;
  final IconData icon;
  final int index;
  const _MethodChip({
    required this.label,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.selectedMethod.value == index;
    return GestureDetector(
      onTap: () => controller.selectMethod(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xff1A4D2E) : Color(0xffE6E6E3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Color(0xff1A4D2E) : Color(0xff6B6B6B),
            ),
            SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                color: isSelected ? Color(0xff1A4D2E) : Color(0xff6B6B6B),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text('Cash'); // build your cash UI here
}

class CreditContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text('Credit'); // build your credit UI here
}

class BankContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text('Bank'); // build your bank UI here
}
