import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/response.dart';
import '../network_constant.dart';

part 'car_client.g.dart';

@RestApi()
abstract class CarClient {
  factory CarClient(Dio dio, {String baseUrl}) = _CarClient;

  @POST(NetworkConstant.kUploadFile1Data)
  Future<BaseResponse<CarDataResponse>> uploadFile1Data(@Body() var model);

  @POST(NetworkConstant.kUploadFile1)
  Future<BaseResponseList<CarDataResponse>> uploadFile1(@Body() var model);

  @POST("${NetworkConstant.kDeleteFile1Record}/{id}")
  Future<BaseResponse<dynamic>> deleteFile1Record(@Path('id') int id);

  @POST(NetworkConstant.kUploadFile2)
  Future<BaseResponse<dynamic>> uploadFile2(@Body() var model);

  @GET('${NetworkConstant.kMatchedData}?page={pageKey}')
  Future<BaseResponseList<CarDataResponse>> matchedData(
      @Path('pageKey') int? pageKey);

  @GET('${NetworkConstant.kFile1Data}?page={pageKey}')
  Future<BaseResponseList<CarDataResponse>> getFile1Data(
      @Path('pageKey') int? pageKey);
}
