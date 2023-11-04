import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import 'bottom_navigation_image.dart';
import 'empty_card.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator(
      {Key? key, required this.index, required this.onChanged})
      : super(key: key);
  final int index;
  final Function(int) onChanged;
  @override
  Widget build(BuildContext context) {
    return EmptyCard(
      shadow: true,
      color: AppColors.white,
      verticalMargin: 0,
      horizontalMargin: 0,
      verticalPadding: 1.h,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35.0), topLeft: Radius.circular(35.0)),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: onChanged,
        backgroundColor: AppColors.white,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomNavigationImage(
              image: AppAssets.kHomeIcon,
              isCurrentIndex: index == 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationImage(
              image: AppAssets.kProfileIcon,
              isCurrentIndex: index == 1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationImage(
              image: AppAssets.kOfferIcon,
              isCurrentIndex: index == 2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationImage(
              image: AppAssets.kHomeIcon,
              isCurrentIndex: index == 3,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationImage(
              image: AppAssets.kHomeIcon,
              isCurrentIndex: index == 4,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
