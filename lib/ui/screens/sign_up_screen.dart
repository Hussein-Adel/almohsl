import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';

class NourEnaikSignUpScreen extends StatelessWidget {
  NourEnaikSignUpScreen({super.key});
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        isLoading: controller.isLoading.value,
        verticalPadding: 0,
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    'إنشاء حساب',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppFontSizes.kS9,
                        fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: EmptyCard(
                verticalPadding: 0.5.h,
                verticalMargin: 0,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                child: Form(
                  key: controller.formSignUpKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                'إدخل البيانات الأساسية',
                                style: TextStyle(
                                    color: AppColors.darkBlue.withOpacity(0.75),
                                    fontSize: AppFontSizes.kS4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: TextFormFieldBuilder(
                            borderColor: Colors.transparent,
                            color: Colors.white,
                            hint: 'البريد الإكتروني',
                            validator: Validators.required('required'),
                            width: 80.w,
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            horizontalMargin: 0,
                            verticalMargin: 0,
                            height: 5.h,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: TextFormFieldBuilder(
                            borderColor: Colors.transparent,
                            color: Colors.white,
                            hint: 'إسم المستخدم',
                            validator: Validators.required('required'),
                            controller: controller.fullNameController,
                            width: 80.w,
                            horizontalMargin: 0,
                            verticalMargin: 0,
                            height: 5.h,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: TextFormFieldBuilder(
                            borderColor: Colors.transparent,
                            color: Colors.white,
                            hint: 'كلمة المرور',
                            validator: Validators.required('required'),
                            controller: controller.passwordController,
                            width: 80.w,
                            horizontalMargin: 0,
                            verticalMargin: 0,
                            height: 5.h,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: TextFormFieldBuilder(
                            borderColor: Colors.transparent,
                            color: Colors.white,
                            hint: 'تأكيد كلمة المرور',
                            validator: Validators.required('required'),
                            controller: controller.confirmPasswordController,
                            width: 80.w,
                            horizontalMargin: 0,
                            verticalMargin: 0,
                            height: 5.h,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: TextFormFieldBuilder(
                            borderColor: Colors.transparent,
                            color: Colors.white,
                            hint: 'رقم الهاتف',
                            keyboardType: TextInputType.phone,
                            validator: Validators.required('required'),
                            controller: controller.phoneController,
                            width: 80.w,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 1.5.h),
                              child: const Text(
                                '+20',
                                style: TextStyle(color: AppColors.cyan),
                              ),
                            ),
                            horizontalMargin: 0,
                            verticalMargin: 0,
                            height: 5.h,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Material(
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: TextFormFieldBuilder(
                            borderColor: Colors.transparent,
                            color: Colors.white,
                            hint: 'الطبيب المعالج',
                            validator: Validators.required('required'),
                            controller: controller.doctorNameController,
                            width: 80.w,
                            horizontalMargin: 0,
                            verticalMargin: 0,
                            height: 5.h,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var isSuccess = await controller.register(context);
                            // isSuccess ? Get.to(MainScreen()) : null;
                          },
                          child: EmptyCard(
                            verticalPadding: 0,
                            color: AppColors.cyan,
                            width: 75.w,
                            height: 9.w,
                            child: Center(
                              child: Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppFontSizes.kS4),
                              ),
                            ),
                          ),
                        ),
                        TextBuilder(
                          verticalPadding: 0,
                          horizontalPadding: 1.w,
                          text: 'استمرار فآنت توافق علي الشروط والأحكام',
                          size: 7.5.sp,
                          bold: true,
                          color: AppColors.darkGray.withOpacity(0.75),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
