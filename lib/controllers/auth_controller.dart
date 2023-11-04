import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/networks/dio_errors.dart';
import '../data/networks/model_response.dart';
import '../data/networks/network_constant.dart';
import '../data/repository/auth_repo.dart';
import '../data/shared/shared_pref.dart';
import '../ui/screens/screens.dart';

class AuthController extends GetxController {
  final _authenticationRepository = locator<AuthenticationRepository>();
  final _sharedPref = locator<SharedPref>();
  bool isLoggedIn = false;
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

  Future<Result<UserData>> login({required var body}) async {
    try {
      final result = await _authenticationRepository.login(body);
      if (result.data != null) {
        InjectionClass.dio.options.headers.addAll({
          NetworkConstant.kAuthorizationHeader:
              '${NetworkConstant.tokenBuilder(result.data!.token!)} '
        });
        await _sharedPref.storeLoginInfo(result.data!);
        isLoggedIn = _sharedPref.isUserLoggedIn();
        currentUser = result.data;
        return Success(result.data!);
      } else {
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: '${result.error?.message}',
        ));
        return Error(errorMessage: result.error?.message);
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'DioException error',
        message: '${e.message}',
      ));
      return Error(errorMessage: DioExceptions.fromDioError(e).message);
    } finally {
      //Dismiss Dialog .
      // Get.back();
    }
  }

  Future<Result<UserData>> signUp({required var body}) async {
    try {
      final result = await _authenticationRepository.register(body);
      if (result.data != null) {
        InjectionClass.dio.options.headers.addAll({
          NetworkConstant.kAuthorizationHeader:
              '${NetworkConstant.tokenBuilder(result.data!.token!)} '
        });
        await _sharedPref.storeLoginInfo(result.data!);
        isLoggedIn = _sharedPref.isUserLoggedIn();
        currentUser = result.data;
        return Success(result.data!);
      } else {
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: '${result.error?.message}',
        ));
        return Error(errorMessage: result.error?.message);
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'DioException error',
        message: '${e.message}',
      ));
      return Error(errorMessage: DioExceptions.fromDioError(e).message);
    } finally {
      //Dismiss Dialog .
      // Get.back();
    }
  }

  void logout() {
    currentUser = UserData();
    _sharedPref.deleteLoginInfo();
    Get.offAll(LoginScreen());
  }
}
