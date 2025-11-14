import 'dart:convert';
import 'dart:developer';

import 'package:flutter_d7/API_day33/constant/endpoint.dart';
import 'package:flutter_d7/API_day33/models/login_model.dart';
import 'package:flutter_d7/API_day33/models/register_model.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<RegisterUserModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );

    log("REGISTER RESPONSE ➜ ${response.body}");
    log("STATUS CODE ➜ ${response.statusCode}");

    if (response.statusCode == 200) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Register gagal");
    }
  }

  static Future<LoginUserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("${Endpoint.baseUrl}/login");
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    log("LOGIN RESPONSE ➜ ${response.body}");
    log("STATUS CODE ➜ ${response.statusCode}");

    if (response.statusCode == 200) {
      return LoginUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Login gagal");
    }
  }
}
