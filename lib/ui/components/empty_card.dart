import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.radius,
    this.verticalPadding,
    this.verticalMargin,
    this.horizontalMargin,
    this.color,
    this.horizontalPadding,
    this.url,
    this.borderRadius,
    this.shadow,
    this.path,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final double? radius;
  final double? verticalPadding;

  final double? horizontalPadding;
  final double? verticalMargin;
  final double? horizontalMargin;
  final Color? color;
  final String? url;
  final String? path;
  final bool? shadow;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 0, vertical: verticalMargin ?? 2.5.h),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 4.w,
          vertical: verticalPadding ?? 3.h),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 35),
        color: color ?? AppColors.white,
        image: url == null && path == null
            ? null
            : DecorationImage(
                image: url == null
                    ? Image.asset(
                        path!,
                        fit: BoxFit.cover,
                      ).image
                    : NetworkImage(
                        url!,
                      ),
                fit: BoxFit.cover,
              ),
        boxShadow: shadow == true
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 6.5,
                  blurRadius: 6.5,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
