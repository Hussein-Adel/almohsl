import 'package:almohsl/ui/components/components.dart';
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
      this.scroll = true,
      this.isLoading,
      this.verticalPadding,
      this.title})
      : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment? crossAlignment;
  final double? radius;
  final double? verticalPadding;
  final double? height;
  final Widget? bottomWidget;
  final Color? backgroundColor;
  final Widget? title;
  final Function()? onPop;
  final bool scroll;
  final bool? isLoading;

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
              Stack(
                children: [
                  Container(
                    decoration: AppStyles.kCardBoxDecoration.copyWith(
                        borderRadius: radius != null
                            ? BorderRadius.circular(radius ?? 25)
                            : const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                        color: AppColors.lightGrey),
                    height: height != null ? height! * 0.67 : 80.h,
                    padding: EdgeInsets.symmetric(
                        horizontal: 4.w, vertical: verticalPadding ?? 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title ?? const SizedBox(),
                        Expanded(
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
                        ),
                      ],
                    ),
                  ),
                  isLoading == true ? const LoadingWidget() : const SizedBox(),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: bottomWidget,
      ),
    );
  }
}
