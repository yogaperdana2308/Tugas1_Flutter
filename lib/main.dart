import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas1_flutter/slicingfigma.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slicing Figma',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: Slicingfigma(),
    );
  }
}
