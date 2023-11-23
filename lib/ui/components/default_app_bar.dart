import 'package:almohsl/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key, this.title, this.onpOp}) : super(key: key);
  final String? title;
  final VoidCallback? onpOp;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 7.5.h,
      leadingWidth: 90.w,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 1.1.h, horizontal: 5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 7.5.w,
              child: InkWell(
                onTap: onpOp ?? () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.green,
                  size: 20.sp,
                ),
              ),
            ),
            SizedBox(
              width: 2.5.w,
            ),
            TextBuilder(
              text: title ?? '',
              color: AppColors.darkGray,
              verticalPadding: 0,
              horizontalPadding: 0,
              align: TextAlign.center,
              bold: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(7.5.h);
}
