import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/request/request.dart';
import '../../models/response/response.dart';
import '../network_constant.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthenticationClient {
  factory AuthenticationClient(Dio dio, {String baseUrl}) =
      _AuthenticationClient;

  @POST(NetworkConstant.kLoginRequest)
  Future<BaseResponse<UserData>> login(
    @Body() LoginRequest model,
  );
  @POST(NetworkConstant.kChangePassword)
  Future<dynamic> forgetPassword(@Body() var model);

  @POST(NetworkConstant.kRegisterRequest)
  Future<BaseResponse<UserData>> register(@Body() var model);

  @PUT(NetworkConstant.kUpdateInfo)
  Future<BaseResponse<UserData>> updateInfo(
      @Queries() Map<String, dynamic> model);
}
