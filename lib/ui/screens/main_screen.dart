import 'package:almohsl/controllers/controllers.dart';
import 'package:almohsl/ui/screens/admin_bottom_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green,
        onPressed: controller.addCar,
        child: const Icon(Icons.add),
      ),
      horizontalPadding: 1.5.w,
      customAppBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => Get.back(),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: Image.asset(
                AppAssets.kCollector,
              ),
            ),
            onTap: () => Get.bottomSheet(
              AdminBottomSheet(),
              isScrollControlled: true,
            ),
          )
        ],
        backgroundColor: AppColors.darkGray,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ListView.builder(
                itemCount: controller.formCount.value,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CarForm(
                    carControllers: controller.textFieldList[index],
                    deleteCar: () => controller.deleteCar(index),
                  );
                },
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
