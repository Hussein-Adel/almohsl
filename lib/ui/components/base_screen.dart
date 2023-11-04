import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/assets.dart';
import 'components.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.body,
    this.horizontalPadding,
    this.verticalPadding,
    this.titleAppBar,
    this.titleOnpOp,
    this.customAppBar,
    this.bottomNavigationBar,
    this.isLoading,
  });
  final Widget body;
  final String? titleAppBar;
  final VoidCallback? titleOnpOp;
  final PreferredSizeWidget? customAppBar;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? bottomNavigationBar;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      // drawer: const MenuScreen(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.kHomeBag), fit: BoxFit.cover),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding?.w ?? 0,
                vertical: verticalPadding?.h ?? 4.h),
            child: SizedBox(
              height: 100.h,
              child: body,
            ),
          ),
          isLoading == true ? const LoadingWidget() : const SizedBox(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
