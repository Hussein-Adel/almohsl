import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import 'components.dart';

class CarForm extends StatelessWidget {
  const CarForm(
      {super.key, required this.carControllers, required this.deleteCar});
  final List<TextEditingController> carControllers;
  final Function() deleteCar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'بيانات السيارة',
                style: TextStyle(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSizes.kS4),
              ),
              IconButton(
                onPressed: deleteCar,
                icon: const Icon(Icons.delete, color: AppColors.error),
              ),
            ],
          ),
          TextFormFieldBuilder(
            defaultBorder: true,
            borderColor: AppColors.green,
            color: Colors.transparent,
            hint: 'رقم اللوحة',
            validator: Validators.required('required'),
            horizontalMargin: 0,
            height: 6.h,
            keyboardType: TextInputType.emailAddress,
            controller: carControllers[0],
          ),
          TextFormFieldBuilder(
            defaultBorder: true,
            borderColor: AppColors.green,
            color: Colors.transparent,
            hint: 'معادلة',
            validator: Validators.required('required'),
            horizontalMargin: 0,
            height: 6.h,
            keyboardType: TextInputType.emailAddress,
            controller: carControllers[1],
          ),
          TextFormFieldBuilder(
            defaultBorder: true,
            borderColor: AppColors.green,
            color: Colors.transparent,
            hint: 'النوع',
            validator: Validators.required('required'),
            horizontalMargin: 0,
            height: 6.h,
            keyboardType: TextInputType.emailAddress,
            controller: carControllers[2],
          ),
          TextFormFieldBuilder(
            defaultBorder: true,
            borderColor: AppColors.green,
            color: Colors.transparent,
            hint: 'الموقع',
            validator: Validators.required('required'),
            horizontalMargin: 0,
            height: 6.h,
            keyboardType: TextInputType.emailAddress,
            controller: carControllers[3],
          ),
          TextFormFieldBuilder(
            defaultBorder: true,
            borderColor: AppColors.green,
            color: Colors.transparent,
            hint: 'الحى',
            validator: Validators.required('required'),
            horizontalMargin: 0,
            height: 6.h,
            keyboardType: TextInputType.emailAddress,
            controller: carControllers[4],
          ),
        ],
      ),
    );
  }
}
