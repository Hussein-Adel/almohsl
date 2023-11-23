import 'package:almohsl/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'components.dart';

class ChoseUploadedFile extends StatelessWidget {
  const ChoseUploadedFile({
    Key? key,
    required this.confirmTab,
    required this.cancelTab,
  }) : super(key: key);
  final VoidCallback confirmTab;
  final VoidCallback cancelTab;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      title: const TextBuilder(
        text: 'أختر نوع الملف المضاف',
        verticalPadding: 0,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ButtonBuilder(
                width: 30.w,
                height: 5.h,
                title: "الملف الأول",
                buttonColor: AppColors.green,
                borderColor: AppColors.green,
                margin: EdgeInsets.symmetric(vertical: 1.h),
                onPressed: confirmTab,
              ),
              const Spacer(),
              ButtonBuilder(
                width: 30.w,
                height: 5.h,
                buttonColor: AppColors.green,
                borderColor: AppColors.green,
                title: "الملف الثانى",
                margin: EdgeInsets.symmetric(
                  vertical: 1.h,
                ),
                onPressed: cancelTab,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
