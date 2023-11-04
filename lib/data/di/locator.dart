import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networks/clients/clients.dart';
import '../networks/logging_interceptor.dart';
import '../networks/network_constant.dart';
import '../repository/repository.dart';
import '../shared/shared_pref.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  /// retrofit clients
  locator.registerFactory(() => AuthenticationClient(
        InjectionClass.dio,
      ));

  /// repositories
  locator.registerFactory<AuthenticationRepository>(() =>
      AuthenticationRepository(
          authenticationClient: locator<AuthenticationClient>()));

  ///Shared preferences
  var instance = await SharedPref.getInstance();
  locator.registerSingleton<SharedPref>(instance);
}

abstract class InjectionClass {
  static final Dio dio = Dio()
    ..interceptors.add(LoggingInterceptor())
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..options.receiveDataWhenStatusError = true
    ..options.baseUrl = NetworkConstant.kBaseUrl
    ..options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json, text/plain, /',
      'X-Requested-With': 'XMLHttpRequest',
      'Content-language': 'ar',
    };
}
