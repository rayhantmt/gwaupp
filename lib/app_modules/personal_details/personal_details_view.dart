import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwaupp/app_modules/personal_details/personal_details_controller.dart';
import 'package:gwaupp/common_widgets/common_button.dart';
import 'package:gwaupp/common_widgets/common_text_field.dart';
import 'package:gwaupp/global_services/global_services.dart';
import 'package:gwaupp/utils/app_images.dart';
import 'package:gwaupp/utils/app_pages.dart';

class PersonalDetailsView extends GetView<PersonalDetailsController> {
  const PersonalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {      
    final serviceController = Get.find<GlobalServicesController>();
    final email = GetStorage().read('email');
    final profileimage =
        serviceController.profileimg.value; //GetStorage().read('profileimg');
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
                  'Personal Details',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: AppImages.greencolor,
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                (serviceController.profileimg.value == null || serviceController.profileimg.value!.isEmpty)
                                    ? AppImages.noprofileimage
                                    : serviceController.profileimg.value!,
                              ),
                              radius: Get.height * 0.07,
                            ),
                    ),
                    Text(
                      'Must be JPG,JPEG or PNG',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.002),
                    GestureDetector(
                      onTap: () => controller.pickProfileImage(),
                      child: Text(
                        'Upload Photo',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff0F3D2E),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Divider(
                      height: 1,
                      indent: 1,
                      endIndent: 1,
                      color: Color(0xffE6E6E3),
                    ),
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ],
                    ),
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
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Text(
                                  'Change Name',

                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Color(0xff1E1E1E),
                                  ),
                                ),
                                CommonTextField(
                                  controller: controller.firstnamecontroller,
                                  tittle: 'First Name',
                                  obsecure: false,
                                ),
                                CommonTextField(
                                  controller: controller.lastnamecontroller,
                                  tittle: 'Last Name',
                                  obsecure: false,
                                ),
                                SizedBox(height: Get.height * 0.03),
                                GestureDetector(
                                  onTap: () {
                                    controller.updateName();
                                    Get.back();
                                  },
                                  child: Obx(
                                    () => controller.isLoading2.value
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: AppImages.greencolor,
                                            ),
                                          )
                                        : CommonButton(tittle: 'Save Changes'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        height: Get.height * 0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE6E6E3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                "${serviceController.firstName} ${serviceController.lastName}",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff1E1E1E),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff6B6B6B),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Row(
                      children: [
                        Text(
                          'Email Address',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: Get.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Change Email Address',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Color(0xff2B2B2B),
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.02),
                                Text(
                                  'Cueent Email',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff1E1E1E),
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.05,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffF2FBF7),
                                  ),
                                  child: Center(child: Text(email)),
                                ),
                                SizedBox(height: Get.height * 0.03),
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(AppPages.changeEmail),
                                  child: CommonButton(tittle: 'Continue'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        height: Get.height * 0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE6E6E3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              email,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff6B6B6B),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              'Delete Account',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xffC84B4B),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
          ],
        ),
      ),
    );
  }
}
