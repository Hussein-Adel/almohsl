import 'package:dio/dio.dart';

import '../../utils/util.dart';
import '../models/request/request.dart';
import '../models/response/response.dart';
import '../networks/base_model.dart';
import '../networks/clients/clients.dart';
import 'repository.dart';

class AuthenticationRepository extends BaseRepository {
  final AuthenticationClient authenticationClient;

  AuthenticationRepository({required this.authenticationClient});

  Future<BaseModel<UserData>> login(LoginRequest model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await authenticationClient.login(model).then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      //Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }

  Future<dynamic> forgetPassword(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data:
                await authenticationClient.forgetPassword(model).then((value) {
          return value;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      //Util.kToastNOInternet();
      return BaseModel.noNetworkConnection();
    }
  }

  Future<BaseModel<UserData>> register(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await authenticationClient.register(model).then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }

  Future<BaseModel<UserData>> updateInfo(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await authenticationClient.updateInfo(model).then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }
}
