import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: AppColors.darkGray.withOpacity(0.075),
      customAppBar: AppBar(
        title: const Text('نسيت كلمة المرور'),
        backgroundColor: AppColors.darkGray,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_sharp)),
      ),
      // isLoading: isLoading,
      verticalPadding: 0,
      body: SingleChildScrollView(
        child: EmptyCard(
          verticalMargin: 4.5.h,
          horizontalMargin: 5.w,
          radius: 17.5,
          child: Form(
            // key: controller.formForgetPasswordKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBuilder(
                  text: 'البريد الإكترونى',
                  align: TextAlign.center,
                  verticalPadding: 1.h,
                  size: 13.5.sp,
                  bold: true,
                ),
                TextFormFieldBuilder(
                  hint: 'example@mail.com',
                  // controller: controller.emailFPasswordController,
                  verticalMargin: 1.5.h,
                ),
                TextBuilder(
                  text:
                      'سوف نقوم بإرسال رسالة نصية إلى البريد الإلكتروني الذي قمت بتسجيله',
                  maxLin: 3,
                  verticalPadding: 1.5.h,
                  align: TextAlign.center,
                ),
                ButtonBuilder(
                  title: 'إرسال',
                  titleStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  buttonColor: AppColors.green.withOpacity(0.95),
                  borderColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
                  height: 5.25.h,
                  width: 70.w,
                  onPressed: () async {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
