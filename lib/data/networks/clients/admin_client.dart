import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/response.dart';
import '../network_constant.dart';

part 'admin_client.g.dart';

@RestApi()
abstract class AdminClient {
  factory AdminClient(Dio dio, {String baseUrl}) = _AdminClient;

  @GET(NetworkConstant.kAdmins)
  Future<BaseResponseList<User>> getAdmins();

  @POST(NetworkConstant.kAdmins)
  Future<BaseResponse<dynamic>> createAdmin(Map<String, dynamic> body);

  @POST(NetworkConstant.kUpdateInfo)
  Future<BaseResponse<dynamic>> updateInfo(@Body() var body);
  @POST(NetworkConstant.kUpdatePassword)
  Future<BaseResponse<dynamic>> updatePassword(@Body() var body);
}
