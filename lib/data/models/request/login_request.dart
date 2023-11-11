class LoginRequest {
  String? email;
  String? password;
  String? token;
  LoginRequest({
    this.email,
    this.password,
    this.token,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email_or_phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['fcm_token'] = token;
    return data;
  }
}
