import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/di/locator.dart';
import '../data/models/request/request.dart';
import '../data/models/response/response.dart';
import '../data/networks/network_constant.dart';
import '../data/repository/auth_repo.dart';
import '../data/shared/shared_pref.dart';
import '../ui/screens/screens.dart';

class AuthController extends GetxController {
  final _authenticationRepository = locator<AuthenticationRepository>();
  final _sharedPref = locator<SharedPref>();
  bool isLoggedIn = false;
  final GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  RxBool showPass = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  changeShowPass() {
    showPass.value = !showPass.value;
  }

  UserData? currentUser = UserData();

  Future<void> checkUserLoggedIn() async {
    isLoggedIn = _sharedPref.isUserLoggedIn();
    if (isLoggedIn) {
      currentUser = await _sharedPref.retrieveUserInfo();
      InjectionClass.dio.options.headers.addAll({
        NetworkConstant.kAuthorizationHeader: 'Bearer ${currentUser!.token}'
      });
    }
  }

  Future<bool> login(BuildContext context) async {
    if (formLoginKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    try {
      var data = LoginRequest(
          email: emailController.text,
          password: passwordController.text,
          token: '');
      final result = await _authenticationRepository.login(data);
      if (result.data != null) {
        InjectionClass.dio.options.headers.addAll({
          NetworkConstant.kAuthorizationHeader:
              '${NetworkConstant.tokenBuilder(result.data!.token!)} '
        });
        await _sharedPref.storeLoginInfo(result.data!);
        isLoggedIn = _sharedPref.isUserLoggedIn();
        currentUser = result.data;
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: '${result.error?.message}',
        ));
        return false;
      }
    } on DioException catch (e) {
      isLoading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: 'DioException error',
          message: '${e.message}',
        ),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    currentUser = UserData();
    _sharedPref.deleteLoginInfo();
    Get.offAll(LoginScreen());
  }
}
