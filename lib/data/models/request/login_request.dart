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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['fcm_token'] = this.token;
    return data;
  }
}
