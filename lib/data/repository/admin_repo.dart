import 'package:almohsl/data/models/response/response.dart';
import 'package:dio/dio.dart';

import '../../utils/util.dart';
import '../networks/base_model.dart';
import '../networks/clients/clients.dart';
import 'repository.dart';

class AdminRepository extends BaseRepository {
  final AdminClient adminClient;
  AdminRepository({required this.adminClient});

  Future<BaseModel<List<User>>> getAdmins() async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await adminClient.getAdmins().then((value) {
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

  Future<BaseModel<UserData>> createAdmin(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await adminClient.createAdmin(model).then((value) {
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

  Future<BaseModel<dynamic>> updateInfo(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await adminClient.updateInfo(model).then((value) {
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

  Future<BaseModel<dynamic>> updatePassword(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await adminClient.updatePassword(model).then((value) {
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
