class RegisterRequest {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  String? doctorName;

  RegisterRequest(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.passwordConfirmation,
      this.doctorName});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['c_password'];
    doctorName = json['doctorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['c_password'] = passwordConfirmation;
    data['doctor_name'] = doctorName;
    return data;
  }
}
