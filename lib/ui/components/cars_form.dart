import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import 'components.dart';

class CarForm extends StatelessWidget {
  const CarForm(
      {super.key,
      required this.carControllers,
      required this.deleteCar,
      required this.keyForm,
      required this.onChange});
  final List<TextEditingController> carControllers;
  final Function() deleteCar;
  final Function(String) onChange;
  final GlobalKey keyForm;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.5.w),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.125),
        borderRadius: BorderRadius.circular(17.5),
      ),
      height: 47.5.h,
      child: Form(
        key: keyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    'بيانات السيارة',
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSizes.kS4),
                  ),
                ),
                IconButton(
                  onPressed: deleteCar,
                  icon: const Icon(Icons.delete, color: AppColors.orange),
                ),
              ],
            ),
            TextFormFieldBuilder(
              defaultBorder: true,
              borderColor: AppColors.green,
              color: Colors.transparent,
              onChange: onChange,
              hint: 'رقم اللوحة',
              validator: Validators.required('required'),
              horizontalMargin: 0,
              verticalMargin: 0,
              controller: carControllers[0],
            ),
            TextFormFieldBuilder(
              defaultBorder: true,
              borderColor: AppColors.green,
              color: Colors.transparent,
              onChange: onChange,
              hint: 'النوع',
              horizontalMargin: 0,
              verticalMargin: 0,
              controller: carControllers[1],
            ),
            TextFormFieldBuilder(
              defaultBorder: true,
              borderColor: AppColors.green,
              color: Colors.transparent,
              onChange: onChange,
              hint: 'الموقع',
              validator: Validators.required('required'),
              horizontalMargin: 0,
              verticalMargin: 0,
              controller: carControllers[2],
            ),
            TextFormFieldBuilder(
              defaultBorder: true,
              borderColor: AppColors.green,
              color: Colors.transparent,
              onChange: onChange,
              hint: 'الحى',
              validator: Validators.required('required'),
              horizontalMargin: 0,
              verticalMargin: 0,
              controller: carControllers[3],
            ),
            TextFormFieldBuilder(
              defaultBorder: true,
              borderColor: AppColors.green,
              color: Colors.transparent,
              onChange: onChange,
              hint: 'الرابط',
              validator: Validators.required('required'),
              horizontalMargin: 0,
              verticalMargin: 0,
              controller: carControllers[4],
            ),
          ],
        ),
      ),
    );
  }
}
