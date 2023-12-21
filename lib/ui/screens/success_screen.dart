import 'package:almohsl/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            SvgPicture.asset(
              AppAssets.kDone,
              height: 22.5.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextBuilder(
              text: 'تم الإرسال بنجاح',
              maxLin: 2,
              width: 50.w,
              align: TextAlign.center,
              size: AppFontSizes.kS6,
              verticalPadding: 2.5.h,
            ),
            TextBuilder(
              text: 'تم إرسال الرقم السرى الجديد\n للبريد الإلكترونى الخاص بكم',
              maxLin: 3,
              align: TextAlign.center,
              size: AppFontSizes.kS6,
              verticalPadding: 2.5.h,
            ),
            ButtonBuilder(
              height: 7.5.h,
              width: 80.w,
              titleStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              buttonColor: AppColors.green.withOpacity(0.95),
              borderColor: Colors.transparent,
              onPressed: () => Get.offAll(LoginScreen()),
              title: 'الذهاب لتسجيل الدخول',
              margin: EdgeInsets.symmetric(vertical: 2.h),
            )
          ],
        ),
      ),
    );
  }
}
