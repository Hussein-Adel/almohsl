import 'package:almohsl/constants/constants.dart';
import 'package:almohsl/controllers/auth_controller.dart';
import 'package:almohsl/data/models/response/response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/di/locator.dart';
import '../data/repository/repository.dart';

class AdminController extends GetxController {
  final AdminRepository _adminRepository = locator<AdminRepository>();
  final GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> updateInfoKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  Rx<AdminSwitch> adminSwitch = AdminSwitch.profile.obs;
  RxList<User> admins = <User>[].obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void changeAdminSwitch(AdminSwitch value) {
    adminSwitch.value = value;
  }

  setData(User user) {
    usernameController.text = user.name!;
    emailController.text = user.email!;
    phoneController.text = user.phone!;
  }

  resetData() {
    adminSwitch.value = AdminSwitch.profile;
    usernameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  FormFieldValidator<String> checkPasswordsMatches(String errorMessage) {
    return (value) {
      //   print("valueee= $value // Password= ${passwordController.text}  ");
      if (value != passwordController.text) {
        return errorMessage;
      }
      return null;
    };
  }

  void getUsers() async {
    try {
      isLoading.value = true;
      admins.clear();
      final result = await _adminRepository.getAdmins();
      if (result.data != null) {
        admins.value = result.data!;
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'DioException error',
        message: '${e.message}',
      ));
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> createAdmin(BuildContext context) async {
    if (changePasswordKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    try {
      var data = {
        'name': usernameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': confirmPasswordController.text,
      };
      final result = await _adminRepository.createAdmin(data);
      if (result.data != null) {
        isLoading.value = false;
        return true;
      }
      return false;
    } on DioException catch (e) {
      isLoading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: 'DioException error',
          message: '${e.message}',
        ),
      );
      return false;
    }
  }

  Future<bool> updateInfo(BuildContext context) async {
    if (updateInfoKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    try {
      var data = {
        'name': usernameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
      };
      final result = await _adminRepository.updateInfo(data);
      if (result.data != null) {
        AuthController authController = Get.find();
        authController.currentUser!.user
          ?..name = usernameController.text
          ..email = emailController.text
          ..phone = phoneController.text;
        isLoading.value = false;
        Get.back();
        return true;
      }
      isLoading.value = false;
      return false;
    } on DioException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'DioException error',
          message: '${e.message}',
        ),
      );
      isLoading.value = false;
      return false;
    }
  }

  Future<bool> updatePassword(BuildContext context) async {
    if (changePasswordKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    try {
      var data = {
        'password': passwordController.text,
        'password_confirmation': confirmPasswordController.text,
      };
      final result = await _adminRepository.updatePassword(data);
      if (result.data != null) {
        isLoading.value = false;
        Get.back();
        return true;
      }
      isLoading.value = false;
      return false;
    } on DioException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'DioException error',
          message: '${e.message}',
        ),
      );
      isLoading.value = false;
      return false;
    }
  }
}
