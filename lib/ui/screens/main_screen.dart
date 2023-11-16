import 'package:almohsl/controllers/controllers.dart';
import 'package:almohsl/ui/screens/admin_bottom_sheet.dart';
import 'package:almohsl/ui/screens/login_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  MainController controller = Get.put(MainController());
  AdminController adminController = Get.put(AdminController());
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        isLoading: controller.isLoading.value,
        bottomNavigationBar: ButtonBuilder(
          title: 'مقارنة البيانات',
          titleStyle:
              TextStyle(color: AppColors.white, fontSize: AppFontSizes.kS5),
          borderColor: Colors.transparent,
          buttonColor: AppColors.orange,
          elevation: 5,
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35)),
            ),
          ),
          onPressed: () => controller.file != null
              ? controller.choseFileAndUpload(context)
              : controller.uploadFile1Data(context),
        ),
        horizontalPadding: 1.5.w,
        customAppBar: AppBar(
          title: const Text('الصفحة الرئيسية'),
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();
              Get.off(LoginScreen());
            },
          ),
          actions: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                child: Image.asset(
                  AppAssets.kCollector,
                ),
              ),
              onTap: () {
                adminController.resetData();
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) {
                      return AdminBottomSheet();
                    });
              },
            )
          ],
          backgroundColor: AppColors.darkGray,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.25.h,
              ),
              controller.fileName.value == ''
                  ? SizedBox(
                      height: 15.h,
                      width: 100.w,
                      child: GestureDetector(
                        onTap: controller.getFile,
                        child: DottedBorder(
                          borderPadding:
                              const EdgeInsets.symmetric(horizontal: 3),
                          dashPattern: const [9, 2.5],
                          strokeWidth: 0.6.w,
                          color: AppColors.darkGray,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12.5),
                          child: Center(
                            child: Icon(
                              Icons.add_rounded,
                              color: AppColors.green,
                              size: 50.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  : EmptyCard(
                      horizontalPadding: 0,
                      horizontalMargin: 2.5.w,
                      verticalMargin: 2.5.h,
                      verticalPadding: 0,
                      radius: 12.5,
                      shadow: true,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: controller.deleteFile,
                            icon: const Icon(Icons.delete,
                                color: AppColors.error),
                          ),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              "تم أختيار الملف :",
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  color: AppColors.darkGray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5.sp),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            child: Text(
                              controller.fileName.value,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  color: AppColors.darkGray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSizes.kS4),
                            ),
                          ),
                        ],
                      ),
                    ),
              CarForm(
                carControllers: controller.textFieldList.value,
                deleteCar: controller.clearCar,
                keyForm: controller.carKey,
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
