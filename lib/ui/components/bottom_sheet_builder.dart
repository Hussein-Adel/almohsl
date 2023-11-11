import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder(
      {Key? key,
      required this.children,
      this.crossAlignment,
      this.bottomWidget,
      this.height,
      this.radius,
      this.onPop,
      this.backgroundColor,
      this.scroll = true})
      : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment? crossAlignment;
  final double? radius;
  final double? height;
  final Widget? bottomWidget;
  final Color? backgroundColor;
  final Function()? onPop;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 91.5.h,
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.transparent,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                child: FloatingActionButton(
                  backgroundColor: AppColors.white,
                  onPressed: onPop ?? () => Navigator.pop(context),
                  child: Icon(
                    Icons.close_rounded,
                    size: 30.sp,
                    color: AppColors.darkGray,
                  ),
                ),
              ),
              Container(
                decoration: AppStyles.kCardBoxDecoration.copyWith(
                    borderRadius: radius != null
                        ? BorderRadius.circular(radius ?? 25)
                        : const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                    color: AppColors.liteWight),
                height: height != null ? height! * 0.67 : 80.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SingleChildScrollView(
                  physics: scroll
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment:
                        crossAlignment ?? CrossAxisAlignment.center,
                    children: children,
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: bottomWidget,
      ),
    );
  }
}
