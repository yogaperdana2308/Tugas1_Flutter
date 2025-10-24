import 'dart:convert';

class UserModel {
  int? id;
  String? username;
  String? email;
  String? password;
  int? nomorhp;
  int? price;
  String? barang;
  UserModel({
    this.id,
    this.username,
    this.email,
    this.password,
    this.nomorhp,
    this.price,
    this.barang,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'nomorhp': nomorhp,
      'price': price,
      'barang': barang,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      nomorhp: map['nomorhp'] != null ? map['nomorhp'] as int : null,
      price: map['price'] != null ? map['price'] as int : null,
      barang: map['barang'] != null ? map['barang'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
