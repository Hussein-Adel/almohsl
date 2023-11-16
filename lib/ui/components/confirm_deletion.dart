import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'components.dart';

class ConfirmDeletion extends StatelessWidget {
  const ConfirmDeletion({
    Key? key,
    required this.confirmTab,
    required this.cancelTab,
  }) : super(key: key);
  final VoidCallback confirmTab;
  final VoidCallback cancelTab;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: EmptyCard(
        verticalPadding: 0,
        verticalMargin: 0,
        horizontalPadding: 0,
        horizontalMargin: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextBuilder(text: "أختر نوع الملف"),
            Row(
              children: [
                ButtonBuilder(
                  width: 30.w,
                  title: "الملف الأول",
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  onPressed: confirmTab,
                ),
                const Spacer(),
                ButtonBuilder(
                  width: 30.w,
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
      ),
    );
  }
}
