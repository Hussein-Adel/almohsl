import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import 'components.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, this.backgroundColor, this.text})
      : super(key: key);
  final Color? backgroundColor;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return EmptyCard(
      verticalPadding: 1.5.h,
      verticalMargin: 1.h,
      color: backgroundColor ?? AppColors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBuilder(
              text: text ?? 'No data found',
              color: AppColors.lightGrey,
              size: AppFontSizes.kS5,
            ),
          ],
        ),
      ),
    );
  }
}
