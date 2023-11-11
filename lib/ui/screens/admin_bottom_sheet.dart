import 'package:almohsl/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';

class AdminBottomSheet extends StatelessWidget {
  AdminBottomSheet({super.key});
  final AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool addUser = adminController.adminSwitch.value == AdminSwitch.addUser;
        return BottomSheetBuilder(
          scroll: addUser,
          children: [
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () =>
                      adminController.changeAdminSwitch(AdminSwitch.users),
                  child: Text(
                    'المستخدمين',
                    style: TextStyle(
                        color: addUser ? AppColors.darkGray : AppColors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSizes.kS6),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      adminController.changeAdminSwitch(AdminSwitch.addUser),
                  child: Text(
                    'أضافة مستخدم',
                    style: TextStyle(
                        color: addUser ? AppColors.green : AppColors.darkGray,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSizes.kS5),
                  ),
                ),
              ],
            ),
            addUser
                ? Column(
                    children: [
                      TextFormFieldBuilder(
                        defaultBorder: true,
                        borderColor: AppColors.green,
                        color: Colors.transparent,
                        hint: 'أسم المستخدم',
                        hintSize: 12.5.sp,
                        validator: Validators.required('required'),
                        horizontalMargin: 0,
                        height: 6.h,
                        // controller: carControllers[0],
                      ),
                      TextFormFieldBuilder(
                        defaultBorder: true,
                        borderColor: AppColors.green,
                        color: Colors.transparent,
                        hint: 'البريد الإلكترونى',
                        hintSize: 12.5.sp,
                        validator: Validators.required('required'),
                        horizontalMargin: 0,
                        height: 6.h,
                        keyboardType: TextInputType.emailAddress,
                        // controller: carControllers[0],
                      ),
                      TextFormFieldBuilder(
                        defaultBorder: true,
                        borderColor: AppColors.green,
                        color: Colors.transparent,
                        hint: 'رقم الهاتف',
                        hintSize: 12.5.sp,
                        validator: Validators.required('required'),
                        horizontalMargin: 0,
                        height: 6.h,
                        keyboardType: TextInputType.phone,
                        // controller: carControllers[0],
                      ),
                      TextFormFieldBuilder(
                        defaultBorder: true,
                        borderColor: AppColors.green,
                        color: Colors.transparent,
                        hint: 'الرقم السرى',
                        hintSize: 12.5.sp,
                        validator: Validators.required('required'),
                        horizontalMargin: 0,
                        height: 6.h,
                        keyboardType: TextInputType.emailAddress,
                        // controller: carControllers[0],
                      ),
                      TextFormFieldBuilder(
                        defaultBorder: true,
                        borderColor: AppColors.green,
                        color: Colors.transparent,
                        hint: 'تأكيد الرقم السرى',
                        hintSize: 12.5.sp,
                        validator: Validators.required('required'),
                        horizontalMargin: 0,
                        height: 6.h,
                        keyboardType: TextInputType.emailAddress,
                        // controller: carControllers[0],
                      ),
                      ButtonBuilder(
                          title: 'حفظ',
                          onPressed: () => adminController
                              .changeAdminSwitch(AdminSwitch.users),
                          margin: EdgeInsets.symmetric(vertical: 1.5.h))
                    ],
                  )
                : SizedBox(
                    height: 72.5.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return EmptyCard(
                          color: AppColors.darkGray.withOpacity(0.7),
                          verticalMargin: 1.h,
                          radius: 17.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBuilder(
                                    text: 'أسم المستخدم : حسين عادل حسين',
                                    bold: true,
                                    color: AppColors.white,
                                    verticalPadding: 0.75.h,
                                  ),
                                  PopupMenuButton(
                                    color: Colors.white,
                                    onSelected: (value) {},
                                    itemBuilder: (BuildContext bc) {
                                      return const [
                                        PopupMenuItem(
                                          child: Text("تعديل"),
                                          value: 'edite',
                                        ),
                                        PopupMenuItem(
                                          child: Text("حذف"),
                                          value: 'delete',
                                        ),
                                      ];
                                    },
                                  )
                                ],
                              ),
                              TextBuilder(
                                text: 'البريد الإلكترونى : admin@example.com	',
                                bold: true,
                                color: AppColors.white,
                                verticalPadding: 0.75.h,
                              ),
                              TextBuilder(
                                text: 'نوع المستخدم :  مسؤل',
                                bold: true,
                                color: AppColors.white,
                                verticalPadding: 0.75.h,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
