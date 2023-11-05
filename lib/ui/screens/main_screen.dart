import 'package:almohsl/controllers/controllers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.green,
          onPressed: () {},
          child: const Icon(Icons.add)),
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
            onTap: () {},
          )
        ],
        backgroundColor: AppColors.darkGray,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
              width: 100.w,
              child: GestureDetector(
                onTap: controller.getFile,
                child: DottedBorder(
                  borderPadding: const EdgeInsets.symmetric(horizontal: 3),
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
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CarForm();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CarForm extends StatelessWidget {
  const CarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 6.h,
          child: TextFormFieldBuilder(
            defaultBorder: true,
            borderColor: AppColors.green,
            color: Colors.white,
            hint: 'البريد الإكتروني',
            validator: Validators.required('required'),
            horizontalMargin: 7.5.w,
            height: 5.h,
            keyboardType: TextInputType.emailAddress,
            // controller: controller.emailController,
          ),
        ),
      ],
    );
  }
}
