import 'dart:convert';

class UserData {
  String? token;
  User? user;

  UserData({this.token, this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['admin'] != null ? User.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['admin'] = user!.toJson();
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

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
