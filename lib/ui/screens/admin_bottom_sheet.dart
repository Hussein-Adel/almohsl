import 'package:almohsl/ui/components/components.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AdminBottomSheet extends StatelessWidget {
  const AdminBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetBuilder(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'المحصلين',
                style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSizes.kS6),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'أضافة محصل',
                style: TextStyle(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSizes.kS5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
