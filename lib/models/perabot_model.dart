import 'package:flutter/material.dart';

class perabotModel {
  final String name;
  final int price;
  final String image;
  final Color? backgroundColor;
  perabotModel({
    required this.name,
    required this.price,
    required this.image,
    this.backgroundColor,
  });
}
