import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/request/request.dart';
import '../data/models/response/user_response.dart';
import '../data/networks/model_response.dart';
import 'controllers.dart';

class LoginController extends AuthController {
  String countryCode = '+966';
  List<String> countryCodeList = ['+20', '+966'];
  final GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  bool showPass = false;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  changeCountryCode(value) {
    countryCode = value;
  }

  changeShowPass() {
    showPass = !showPass;
  }

  Future<bool> loginWithEmail(BuildContext context) async {
    if (formLoginKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    // String? firebaseToken = await FirebaseMessaging.instance.getToken();
    var data = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
        token: '');
    final result = await login(body: data);

    if (result is Success<UserData>) {
      AuthController authController = Get.find();
      authController.currentUser = currentUser;
      isLoading.value = false;
      return true;
    } else {
      isLoading.value = false;
      // Util.showSnackBar(context,
      //     message: (result as Error<UserData?>).errorMessage);

      return false;
    }
  }
}
