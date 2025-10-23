import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas_flutter/tugas10.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/latihan1': (context) => Latihan1(),
      //   '/tugas4': (context) => Tugas4(),
      //   '/tugas5': (context) => Tugas5(),
      //   '/lanjutan1': (context) => LanjutanLatihan1(),
      // },
      title: 'Tugas 10',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: Tugas10(),
    );
  }
}
