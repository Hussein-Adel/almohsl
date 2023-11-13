import 'package:dio/dio.dart';

import '../../utils/util.dart';
import '../networks/base_model.dart';
import '../networks/clients/clients.dart';
import 'repository.dart';

class CarRepository extends BaseRepository {
  final CarClient carClient;

  CarRepository({required this.carClient});

  Future<BaseModel<dynamic>> uploadFile1Data(var model) async {
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
}
