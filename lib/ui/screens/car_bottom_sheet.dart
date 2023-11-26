import 'package:almohsl/data/models/response/all_data_car_response.dart';
import 'package:almohsl/ui/components/components.dart';
import 'package:almohsl/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';

class CarBottomSheet extends StatelessWidget {
  const CarBottomSheet({
    super.key,
    required this.carData,
  });
  final CarDataResponse carData;
  @override
  Widget build(BuildContext context) {
    return BottomSheetBuilder(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextBuilder(
            text: 'بيانات السيارة :',
            verticalPadding: 0,
            bold: true,
            size: AppFontSizes.kS4,
            color: AppColors.green,
          ),
          carData.url != null
              ? IconButton(
                  onPressed: () => Util.openMap(uri: carData.url!),
                  icon: const Icon(Icons.map_outlined, color: AppColors.orange),
                )
              : const SizedBox()
        ],
      ),
      verticalPadding: 2.5.h,
      children: [
        CarDataComponent(
          title: 'اسم العميل',
          subTitle: carData.username,
        ),
        CarDataComponent(
          title: 'رقم اللوحة',
          subTitle: carData.carNumber,
        ),
        CarDataComponent(
          title: 'النوع',
          subTitle: carData.type,
        ),
        CarDataComponent(
          title: 'الحي',
          subTitle: carData.district,
        ),
        CarDataComponent(
          title: 'الموقع',
          subTitle: carData.location,
        ),
        CarDataComponent(
          title: 'الرابط',
          width: 65.w,
          subTitle: carData.url,
        ),
        CarDataComponent(
          title: 'صانع المركبة',
          subTitle: carData.vehicleManufacturer,
        ),
        CarDataComponent(
          title: 'طراز المركبة',
          subTitle: carData.vehicleModel,
        ),
        CarDataComponent(
          title: 'هيكل المرور',
          subTitle: carData.trafficStructure,
        ),
        CarDataComponent(
          title: 'المصدر',
          subTitle: carData.source,
        ),
        CarDataComponent(
          title: 'اللون',
          subTitle: carData.color,
        ),
        CarDataComponent(
          title: 'الموديل',
          subTitle: carData.modelYear,
        ),
        CarDataComponent(
          title: 'نوع تسجيل اللوحة',
          subTitle: carData.contractNumber,
        ),
        CarDataComponent(
          title: 'هوية المستخدم',
          subTitle: carData.userIdentity,
        ),
        CarDataComponent(
          title: 'رقم العقد',
          subTitle: carData.contractNumber,
        ),
        CarDataComponent(
          title: 'Cic',
          subTitle: carData.cic,
        ),
        CarDataComponent(
          title: 'حالة الشهادة',
          subTitle: carData.certificateStatus,
        ),
        CarDataComponent(
          title: 'عدد المركبات',
          subTitle: carData.vehiclesCount,
        ),
        CarDataComponent(
          title: 'المنتج',
          subTitle: carData.product,
        ),
        CarDataComponent(
          title: 'عدد الأقساط',
          subTitle: carData.installmentsCount,
        ),
        CarDataComponent(
          title: 'أيام التاخير',
          subTitle: carData.lateDaysCount,
        ),
        CarDataComponent(
          title: 'المدينة',
          subTitle: carData.city,
        ),
        CarDataComponent(
          title: 'جهة العمل',
          subTitle: carData.employer,
          divider: false,
        ),
      ],
    );
  }
}

class CarDataComponent extends StatelessWidget {
  const CarDataComponent(
      {super.key,
      required this.title,
      required this.subTitle,
      this.divider = true,
      this.width});
  final String? title;
  final String? subTitle;
  final double? width;
  final bool divider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBuilder(
              text: title,
              bold: true,
              width: 25.w,
              color: AppColors.navyBlue,
              verticalPadding: 0.75.h,
            ),
            TextBuilder(
              text: subTitle,
              color: AppColors.navyBlue,
              horizontalPadding: 0,
              width: width ?? 40.w,
              align: TextAlign.end,
              verticalPadding: 0.75.h,
            ),
          ],
        ),
        divider
            ? DividerBuilder(
                dividerColor: AppColors.gray,
                thickness: 1,
                width: 90.w,
              )
            : const SizedBox(),
      ],
    );
  }
}
