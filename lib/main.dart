import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas1_flutter/lanjutan_latihan1.dart';
import 'package:flutter_d7/tugas1_flutter/latihan1.dart';
import 'package:flutter_d7/tugas1_flutter/latihan_drawer.dart';
import 'package:flutter_d7/tugas1_flutter/tugas4.dart';
import 'package:flutter_d7/tugas1_flutter/tugas5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/latihan1': (context) => Latihan1(),
        '/tugas4': (context) => Tugas4(),
        '/tugas5': (context) => Tugas5(),
        '/lanjutan1': (context) => LanjutanLatihan1(),
      },
      title: 'drawer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: LatihanDrawer(),
    );
  }
}
