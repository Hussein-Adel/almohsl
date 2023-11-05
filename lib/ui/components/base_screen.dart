import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    this.floatingActionButton,
  });
  final Widget body;
  final Widget? floatingActionButton;
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
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: customAppBar,
      // drawer: const MenuScreen(),
      body: Stack(
        children: [
          Container(
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
