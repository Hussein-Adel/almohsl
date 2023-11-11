import 'package:almohsl/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../../data/models/response/user_response.dart';

class AdminBottomSheet extends StatelessWidget {
  AdminBottomSheet({super.key});
  final AdminController adminController = Get.find();
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    User? user = authController.currentUser?.user;

    return Obx(
      () => BottomSheetBuilder(
        isLoading: adminController.isLoading.value,
        // scroll: !users,
        children: adminController.adminSwitch.value == AdminSwitch.profile
            ? [
                SizedBox(
                  height: 2.5.h,
                ),
                TextBuilder(
                  text: 'حسابى',
                  size: AppFontSizes.kS6,
                  bold: true,
                  verticalPadding: 0,
                ),
                Stack(
                  children: [
                    EmptyCard(
                      horizontalMargin: 0,
                      verticalMargin: 2.5.h,
                      horizontalPadding: 5.w,
                      color: AppColors.white,
                      radius: 17.5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextBuilder(
                                text: 'الإسم :',
                                color: AppColors.darkGray,
                                // alignment: AlignmentDirectional.centerStart,
                                verticalPadding: 1.h,
                              ),
                              TextBuilder(
                                text: user?.name,
                                verticalPadding: 1.h,
                                color: AppColors.darkGray,
                                horizontalPadding: 1.5.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextBuilder(
                                text: 'البريد الإليكترونى :',
                                verticalPadding: 1.h,
                                color: AppColors.darkGray,
                                // alignment: AlignmentDirectional.centerStart,
                              ),
                              TextBuilder(
                                text: user?.email,
                                verticalPadding: 1.h,
                                color: AppColors.darkGray,
                                horizontalPadding: 1.5.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextBuilder(
                                text: "الهاتف :",
                                // alignment: AlignmentDirectional.centerStart,
                                color: AppColors.darkGray,
                                verticalPadding: 1.h,
                              ),
                              TextBuilder(
                                text: user?.phone,
                                color: AppColors.darkGray,
                                verticalPadding: 1.h,
                                horizontalPadding: 1.5.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    PositionedDirectional(
                      top: 4.5.h,
                      end: 2.5.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () {
                          adminController.setData(user!);
                          adminController
                              .changeAdminSwitch(AdminSwitch.updateUser);
                        },
                        child: Row(
                          children: [
                            getDefaultSvgIcon(
                                image: AppAssets.kEditIcon,
                                color: AppColors.green,
                                height: 2.25,
                                width: 2.25),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1.25.w,
                              ),
                              child: Text(
                                'تعديل',
                                style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: AppFontSizes.kS4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                  onPressed: () {
                    adminController
                        .changeAdminSwitch(AdminSwitch.changePassword);
                  },
                  child: EmptyCard(
                    verticalMargin: 0,
                    horizontalMargin: 0,
                    radius: 17.5,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                          child: const Icon(
                            Icons.lock_outlined,
                            color: AppColors.green,
                          ),
                        ),
                        TextBuilder(
                          text: "تغيير كلمة السر",
                          color: AppColors.darkGray,
                          verticalPadding: 0,
                          horizontalPadding: 1.5.w,
                          size: AppFontSizes.kS4,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: AppFontSizes.kS5,
                          color: AppColors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            : adminController.adminSwitch.value == AdminSwitch.updateUser
                ? [
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            adminController.resetData();
                            // adminController.changeAdminSwitch(AdminSwitch.profile);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColors.darkGray,
                            size: AppFontSizes.kS7,
                          ),
                        ),
                        const Spacer(),
                        TextBuilder(
                          text: 'تعديل البيانات',
                          size: AppFontSizes.kS6,
                          bold: true,
                          verticalPadding: 0,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: AppFontSizes.kS7,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Form(
                      key: adminController.updateInfoKey,
                      child: Column(
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
                            controller: adminController.usernameController,
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
                            controller: adminController.emailController,
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
                            controller: adminController.phoneController,
                          ),
                        ],
                      ),
                    ),
                    ButtonBuilder(
                      title: 'حفظ',
                      height: 5.h,
                      width: 80.w,
                      margin: EdgeInsets.symmetric(vertical: 2.5.h),
                      borderColor: Colors.transparent,
                      buttonColor: AppColors.green,
                      onPressed: () => adminController.updateInfo(context),
                    ),
                  ]
                : [
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            adminController.resetData();
                            // adminController.changeAdminSwitch(AdminSwitch.profile);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColors.darkGray,
                            size: AppFontSizes.kS7,
                          ),
                        ),
                        const Spacer(),
                        TextBuilder(
                          text: 'تغيير الرقم السرى',
                          size: AppFontSizes.kS6,
                          bold: true,
                          verticalPadding: 0,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: AppFontSizes.kS7,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Form(
                      key: adminController.changePasswordKey,
                      child: Column(
                        children: [
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
                            controller: adminController.passwordController,
                          ),
                          TextFormFieldBuilder(
                            defaultBorder: true,
                            borderColor: AppColors.green,
                            color: Colors.transparent,
                            hint: 'تأكيد الرقم السرى',
                            hintSize: 12.5.sp,
                            validator: Validators.compose([
                              Validators.required('required'),
                              adminController.checkPasswordsMatches(
                                'Not Match ',
                              )
                            ]),
                            horizontalMargin: 0,
                            height: 6.h,
                            controller:
                                adminController.confirmPasswordController,
                          ),
                        ],
                      ),
                    ),
                    ButtonBuilder(
                      title: 'حفظ',
                      height: 5.h,
                      width: 80.w,
                      margin: EdgeInsets.symmetric(vertical: 2.5.h),
                      borderColor: Colors.transparent,
                      buttonColor: AppColors.green,
                      onPressed: () => adminController.updatePassword(context),
                    ),
                  ],
      ),
    );
  }
}
// [
//   SizedBox(
//     height: 1.5.h,
//   ),
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       TextButton(
//         onPressed: () =>
//             adminController.changeAdminSwitch(AdminSwitch.users),
//         child: Text(
//           'المستخدمين',
//           style: TextStyle(
//               color: !users ? AppColors.darkGray : AppColors.green,
//               fontWeight: FontWeight.bold,
//               fontSize: AppFontSizes.kS6),
//         ),
//       ),
//       const VerticalDividerBuilder(
//         dividerColor: AppColors.green,
//       ),
//       TextButton(
//         onPressed: () =>
//             adminController.changeAdminSwitch(AdminSwitch.addUser),
//         child: Text(
//           'أضافة مستخدم',
//           style: TextStyle(
//               color: !users ? AppColors.green : AppColors.darkGray,
//               fontWeight: FontWeight.bold,
//               fontSize: AppFontSizes.kS5),
//         ),
//       ),
//     ],
//   ),
//   !users
//       ? Column(
//           children: [
//             TextFormFieldBuilder(
//               defaultBorder: true,
//               borderColor: AppColors.green,
//               color: Colors.transparent,
//               hint: 'أسم المستخدم',
//               hintSize: 12.5.sp,
//               validator: Validators.required('required'),
//               horizontalMargin: 0,
//               height: 6.h,
//               controller: adminController.usernameController,
//             ),
//             TextFormFieldBuilder(
//               defaultBorder: true,
//               borderColor: AppColors.green,
//               color: Colors.transparent,
//               hint: 'البريد الإلكترونى',
//               hintSize: 12.5.sp,
//               validator: Validators.required('required'),
//               horizontalMargin: 0,
//               height: 6.h,
//               keyboardType: TextInputType.emailAddress,
//               controller: adminController.emailController,
//             ),
//             TextFormFieldBuilder(
//               defaultBorder: true,
//               borderColor: AppColors.green,
//               color: Colors.transparent,
//               hint: 'رقم الهاتف',
//               hintSize: 12.5.sp,
//               validator: Validators.required('required'),
//               horizontalMargin: 0,
//               height: 6.h,
//               keyboardType: TextInputType.phone,
//               controller: adminController.phoneController,
//             ),
//             TextFormFieldBuilder(
//               defaultBorder: true,
//               borderColor: AppColors.green,
//               color: Colors.transparent,
//               hint: 'الرقم السرى',
//               hintSize: 12.5.sp,
//               validator: Validators.required('required'),
//               horizontalMargin: 0,
//               height: 6.h,
//               controller: adminController.passwordController,
//             ),
//             TextFormFieldBuilder(
//               defaultBorder: true,
//               borderColor: AppColors.green,
//               color: Colors.transparent,
//               hint: 'تأكيد الرقم السرى',
//               hintSize: 12.5.sp,
//               validator: Validators.required('required'),
//               horizontalMargin: 0,
//               height: 6.h,
//               controller: adminController.confirmPasswordController,
//             ),
//             ButtonBuilder(
//                 title: 'حفظ',
//                 buttonColor: AppColors.green,
//                 borderColor: Colors.transparent,
//                 height: 5.h,
//                 width: 80.w,
//                 onPressed: () => adminController
//                     .changeAdminSwitch(AdminSwitch.users),
//                 margin: EdgeInsets.symmetric(vertical: 1.5.h))
//           ],
//         )
//       : Stack(
//           children: [
//             SizedBox(
//               height: 72.5.h,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 itemCount: adminController.admins.length,
//                 itemBuilder: (context, index) {
//                   User admin = adminController.admins[index];
//                   return EmptyCard(
//                     color: AppColors.darkGray.withOpacity(0.7),
//                     verticalMargin: 1.h,
//                     radius: 17.5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextBuilder(
//                               text: 'أسم المستخدم : ${admin.name}',
//                               bold: true,
//                               color: AppColors.white,
//                               verticalPadding: 0.75.h,
//                             ),
//                             PopupMenuButton<AdminSwitch>(
//                               color: Colors.white,
//                               onSelected:
//                                   adminController.changeAdminSwitch,
//                               itemBuilder: (BuildContext bc) {
//                                 return [
//                                   const PopupMenuItem(
//                                     value: AdminSwitch.updateUser,
//                                     child: Text("تعديل البيانات"),
//                                   ),
//                                   const PopupMenuItem(
//                                     value: AdminSwitch.changePassword,
//                                     child: Text("تعديل كلمة السر"),
//                                   ),
//                                   const PopupMenuItem(
//                                     value: AdminSwitch.deleteUser,
//                                     child: Text("حذف"),
//                                   ),
//                                 ];
//                               },
//                             )
//                           ],
//                         ),
//                         TextBuilder(
//                           text: 'البريد الإلكترونى : ${admin.email}	',
//                           bold: true,
//                           color: AppColors.white,
//                           verticalPadding: 0.75.h,
//                         ),
//                         TextBuilder(
//                           text: 'رقم الهاتف :  ${admin.phone}',
//                           bold: true,
//                           color: AppColors.white,
//                           verticalPadding: 0.75.h,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             adminController.isLoading.value
//                 ? const LoadingWidget()
//                 : const SizedBox(),
//           ],
//         ),
// ],
