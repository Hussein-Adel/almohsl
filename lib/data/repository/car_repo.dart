import 'package:dio/dio.dart';

import '../../utils/util.dart';
import '../models/response/response.dart';
import '../networks/base_model.dart';
import '../networks/clients/clients.dart';
import 'repository.dart';

class CarRepository extends BaseRepository {
  final CarClient carClient;

  CarRepository({required this.carClient});

  Future<BaseModel<CarDataResponse>> uploadFile1Data(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await carClient.uploadFile1Data(model).then((value) {
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

  Future<BaseModel<List<CarDataResponse>>> uploadFile1(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await carClient.uploadFile1(model).then((value) {
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

  Future<BaseModel<dynamic>> deleteFile1Record(int id) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await carClient.deleteFile1Record(id).then((value) {
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

  Future<BaseModel<dynamic>> uploadFile2(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await carClient.uploadFile2(model).then((value) {
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

  Future<BaseModel<List<CarDataResponse>>> matchedData() async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await carClient.matchedData().then((value) {
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
