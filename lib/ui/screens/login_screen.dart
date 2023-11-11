import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';
import 'screens.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        isLoading: controller.isLoading.value,
        verticalPadding: 0,
        body: Column(
          children: [
            SizedBox(
              height: 12.5.h,
            ),
            Center(
              child: Image.asset(
                AppAssets.kLogo,
                scale: 1,
              ),
            ),
            Container(
              color: Colors.white,
              height: 2.5.h,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: controller.formLoginKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 7.h,
                              child: TextFormFieldBuilder(
                                defaultBorder: true,
                                borderColor: AppColors.green,
                                color: Colors.white,
                                hint: 'البريد الإكتروني',
                                horizontalMargin: 7.5.w,
                                verticalMargin: 0,
                                validator: Validators.required('required'),
                                height: 5.h,
                                controller: controller.emailController,
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                              child: TextFormFieldBuilder(
                                defaultBorder: true,
                                borderColor: AppColors.green,
                                color: Colors.white,
                                hint: 'كلمة المرور',
                                horizontalMargin: 7.5.w,
                                verticalMargin: 0,
                                validator: Validators.required('required'),
                                height: 5.h,
                                obscureText: controller.showPass.value == true,
                                suffixIcon: IconButton(
                                  icon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.5.w),
                                    child: Icon(
                                      controller.showPass.value
                                          ? Icons.visibility_rounded
                                          : Icons.visibility_off_rounded,
                                      color: controller.showPass.value
                                          ? AppColors.green
                                          : null,
                                    ),
                                  ),
                                  onPressed: () => controller.changeShowPass(),
                                ),
                                controller: controller.passwordController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          children: [
                            CheckBoxBuilder(
                              onChanged: (value) {},
                              value: true,
                              activeColor:
                                  AppColors.darkGray.withOpacity(0.125),
                              checkColor: AppColors.green,
                            ),
                            Text(
                              'تذكرني',
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => Get.to(const ForgetPasswordScreen()),
                              child: Text(
                                'نسيت كلمة المرور ؟',
                                style: TextStyle(
                                    fontSize: 11.sp, color: AppColors.darkGray),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var isSuccess = await controller.login(context);
                          isSuccess ? Get.to(() => MainScreen()) : null;
                        },
                        child: EmptyCard(
                          verticalPadding: 0,
                          color: AppColors.darkGray,
                          width: 75.w,
                          height: 11.5.w,
                          verticalMargin: 3.5.h,
                          child: Center(
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppFontSizes.kS4),
                            ),
                          ),
                        ),
                      ),
                    ],
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
