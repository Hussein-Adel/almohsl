import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class ButtonBuilder extends StatelessWidget {
  final Color buttonColor;
  final Color borderColor;
  final VoidCallback? onPressed;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String title;
  final Color? titleColor;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final TextStyle? titleStyle;
  final double? elevation;
  final MaterialStateProperty<OutlinedBorder>? shape;

  const ButtonBuilder({
    super.key,
    this.buttonColor = AppColors.blue,
    this.suffixIcon,
    this.prefixIcon,
    required this.title,
    this.onPressed,
    this.titleColor,
    this.width,
    this.height,
    this.radius,
    this.margin,
    this.titleStyle,
    this.borderColor = AppColors.blue,
    this.elevation = 0,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 6.5.h,
      margin: margin,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevation),
            enableFeedback: false,
            shadowColor: MaterialStateProperty.all(AppColors.primary),
            side: MaterialStateProperty.all(
              BorderSide(
                width: 0.3.w,
                color: borderColor,
              ),
            ),
            shape: shape ??
                MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius ?? 50),
                    ),
                  ),
                ),
            backgroundColor: MaterialStateProperty.all(
              buttonColor,
            )),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: suffixIcon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          children: [
            prefixIcon ?? const SizedBox(),
            Text(
              title,
              style: titleStyle ??
                  TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.bold,
                      color: titleColor ?? AppColors.white),
            ),
            suffixIcon ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
