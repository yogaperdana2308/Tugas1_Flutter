import 'dart:convert';

class UserModel {
  int? id;
  String? username;
  String? email;
  String? password;
  String? nomorhp;
  UserModel({this.id, this.username, this.email, this.password, this.nomorhp});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'nomorhp': nomorhp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      nomorhp: map['nomorhp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
