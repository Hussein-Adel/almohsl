import 'dart:convert';

class UserData {
  String? token;
  User? user;

  UserData({this.token, this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  String convertUserToSharedPreferencesObject() => jsonEncode(this);
  factory UserData.fromSharedPreferencesObject(String? prefObject) {
    if (prefObject != null) {
      return UserData.fromJson(jsonDecode(prefObject));
    }
    return UserData();
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? doctorName;
  String? otp;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.doctorName,
    this.otp,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    doctorName = json['doctor_name'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['doctor_name'] = doctorName;
    data['otp'] = otp;
    return data;
  }
}
