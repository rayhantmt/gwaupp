import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/select_category_income/select_category_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class SelectCategoryView extends GetView<SelectCategoryController> {
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchCategories();
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                SizedBox(width: Get.width * 0.05),
                Text(
                  'Select Category',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Container(
              height: Get.height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000),
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Color(0xff000000).withOpacity(0.1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hint: Row(
                      children: [
                        SizedBox(width: Get.width * 0.05),
                        Icon(Icons.search, color: Color(0xff6B6B6B)),
                        SizedBox(width: Get.width * 0.05),
                        Text(
                          'Find Category',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff6B6B6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: Get.height * 0.03),
            SizedBox(
              height: Get.height * 0.64,
              child: Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: Row(
                          children: [
                            Text('Loading Categories'),
                            LinearProgressIndicator(
                              color: AppImages.greencolor,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) => Obx(
                          () => Container(
                            height: Get.height * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.categories[index].category,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xff2B2B2B),
                                  ),
                                ),
                                Checkbox(
                                  activeColor: Color(0xff0F3D2E),
                                  value: controller
                                      .categories[index]
                                      .isSelected
                                      .value,
                                  onChanged: (value) =>
                                      controller.toggle(value!, index),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            //SizedBox(height: Get.height * 0.13),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: Get.height * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xff1E1E1E),
                            ),
                            SizedBox(width: Get.width * 0.02),
                            Text(
                              'Add New Category',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Category',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffD8D9E0),
                            ),
                          ),
                          child: TextFormField(
                            controller: controller.newcategorycontroller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              hint: Row(
                                children: [
                                  Image.asset(
                                    AppImages.incomeCategory,
                                    height: Get.height * 0.03,
                                  ),
                                  SizedBox(width: Get.width * 0.05),
                                  Text(
                                    'Enter category name',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff6B6B6B),
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        GestureDetector(
                          //onTap: () => Get.back(),
                         // onTap: () => controller.addNewCategory(),
                         onTap: () {
                           controller.addNewCategory();
                           controller.fetchCategories();
                           Get.back();
                         },
                          child: Obx(
                            () => controller.isLoading2.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppImages.greencolor,
                                    ),
                                  )
                                : CommonButton(tittle: 'Save & Apply'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: Image.asset(AppImages.addNewCategory),
            ),
            SizedBox(height: Get.height * 0.03),
            GestureDetector(
              onTap: () => Get.offNamed(AppPages.addincome),
              child: CommonButton(tittle: 'Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}
