import 'dart:convert';

import 'package:flutter_d7/API_day31/model/cat_model.dart';
import 'package:http/http.dart' as http;

Future<List<CatModel>> fetchCat() async {
  final response = await http.get(
    Uri.parse("https://api.thecatapi.com/v1/images/search?limit=10"),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> catJson = json.decode(response.body);
    return catJson.map((json) => CatModel.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load Cat");
  }
}
