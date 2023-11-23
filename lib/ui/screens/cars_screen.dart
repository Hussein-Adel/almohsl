import 'package:almohsl/controllers/controllers.dart';
import 'package:almohsl/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../data/models/response/response.dart';

class CarsScreen extends StatelessWidget {
  CarsScreen({super.key});
  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: AppColors.darkGray.withOpacity(0.25),
      bottomNavigationBar: ButtonBuilder(
        title: 'مقارنة الملفات',
        titleStyle:
            TextStyle(color: AppColors.white, fontSize: AppFontSizes.kS5),
        borderColor: Colors.transparent,
        buttonColor: AppColors.orange,
        elevation: 5,
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          ),
        ),
        onPressed: () => controller.matchedData(),
      ),
      titleAppBar: 'السيارات المرفوعة',
      body: ListView.builder(
        itemCount: controller.cars.length,
        itemBuilder: (BuildContext context, int index) {
          CarDataResponse car = controller.cars[index];
          return EmptyCard(
            verticalMargin: 1.h,
            horizontalMargin: 5.w,
            verticalPadding: 1.h,
            horizontalPadding: 5.w,
            radius: 7.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBuilder(
                      text: 'بيانات السيارة',
                      verticalPadding: 1.h,
                      color: AppColors.green,
                    ),
                    IconButton(
                      onPressed: () => controller.deleteFile1Record(index),
                      icon: const Icon(Icons.delete, color: AppColors.orange),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextBuilder(
                          text: 'رقم اللوحة :  ',
                          verticalPadding: 1.h,
                          color: AppColors.green,
                        ),
                        TextBuilder(
                          text: car.carNumber,
                          verticalPadding: 1.h,
                          width: 15.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextBuilder(
                          text: 'النوع : ',
                          verticalPadding: 1.h,
                          color: AppColors.green,
                        ),
                        TextBuilder(
                          text: car.type,
                          verticalPadding: 1.h,
                          width: 15.w,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextBuilder(
                          text: 'الموقع :  ',
                          verticalPadding: 1.h,
                          color: AppColors.green,
                        ),
                        TextBuilder(
                          text: car.location,
                          verticalPadding: 1.h,
                          width: 15.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextBuilder(
                          text: 'الحى :  ',
                          verticalPadding: 1.h,
                          color: AppColors.green,
                        ),
                        TextBuilder(
                          text: car.district,
                          verticalPadding: 1.h,
                          width: 15.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
