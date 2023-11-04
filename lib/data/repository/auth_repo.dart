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

  Future<BaseModel<String>> sendOtp(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await authenticationClient.sendOtp(model).then((value) {
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

  Future<BaseModel<UserData>> verify(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await authenticationClient.verify(model).then((value) {
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

  // Future<BaseModel<UserData>> checkOtp(var model, String email) async {
  //   if (await checkForConnectivity()) {
  //     try {
  //       return BaseModel(
  //           data:
  //               await authenticationClient.checkOtp(model, email).then((value) {
  //         return value.data;
  //       }));
  //     } on DioException catch (e) {
  //       return BaseModel(error: ErrorResponse(dioException: e));
  //     }
  //   } else {
  //     //Util.kToastNOInternet();
  //
  //     return BaseModel.noNetworkConnection();
  //   }
  // }

  Future<BaseModel<dynamic>> changePassword(var model, String email) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await authenticationClient
                .changePassword(model, email)
                .then((value) {
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

  Future<dynamic> updatePassword(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data:
                await authenticationClient.updatePassword(model).then((value) {
          return value;
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
