class NetworkConstant {
  static const int kPageSize = 8;
  static const String kPageSizeParam = 'paginate';
  static const String kPageNumberParam = 'page';
  static const int kPageNumberValue = 1;

  static const _kDevBaseUrl = 'http://192.168.1.130:8000/api/';
  static const _kReleaseBaseUrl = 'https://almohsel.com/api/';
  static const kAppleStoreUrl = '';
  static const kGooglePlayUrl = '';
  static const kAndroidPackage = '';
  static const kAppleId = '';
  static const kAuthorizationHeader = "authorization";
  static const kBaseUrl = _kReleaseBaseUrl;
  static const kGoogleApiKey = 'AIzaSyBZFRav3jNg1pH9RAQxO1IhOGb7keLaoDM';

  static const kTestToken = '';

  static String tokenBuilder(String token) => 'Bearer $token';

  static const String kHomeRequest = "home";
  static const String kLoginRequest = "login";
  static const String kRegisterRequest = "register";
  static const String kAdmins = "admins";
  static const String kUpdateInfo = "admins/update-info";
  static const String kUpdatePassword = "admins/update-password";
  static const String kUploadFile1Data = "upload-file1-data";
  static const String kUploadFile1 = "upload-file1";
  static const String kDeleteFile1Record = "delete-file1-record";
  static const String kUploadFile2 = "upload-file2";
  static const String kMatchedData = "matched-data";
  static const String kFile1Data = "file1-data";

  static const String kChangePassword = "change-password";
}
