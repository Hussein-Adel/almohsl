import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/response.dart';
import '../network_constant.dart';

part 'car_client.g.dart';

@RestApi()
abstract class CarClient {
  factory CarClient(Dio dio, {String baseUrl}) = _CarClient;

  @POST(NetworkConstant.kUploadFile1Data)
  Future<BaseResponse<dynamic>> uploadFile1Data(@Body() var model);
}