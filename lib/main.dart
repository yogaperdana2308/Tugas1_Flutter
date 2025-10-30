import 'package:flutter/material.dart';
import 'package:flutter_d7/E-Nventory/view/login_screen.dart';
import 'package:flutter_d7/day_19/view/login_screen.dart';
// import 'package:flutter_d7/day_21/view/create_items.dart';
// import 'package:flutter_d7/day_21/view/login_screen.dart';
// import 'package:flutter_d7/day_21/view/register_screen.dart';
import 'package:flutter_d7/tugas_flutter/lanjutan_latihan1.dart';
import 'package:flutter_d7/tugas_flutter/latihan1.dart';
import 'package:flutter_d7/tugas_flutter/tugas4.dart';
import 'package:flutter_d7/tugas_flutter/tugas5.dart';
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
      routes: {
        '/latihan1': (context) => Latihan1(),
        '/tugas4': (context) => Tugas4(),
        '/tugas5': (context) => Tugas5(),
        '/lanjutan1': (context) => LanjutanLatihan1(),
        '/login_screen': (context) => LoginScreen(),
        // '/register_screen': (context) => RegisterScreenday21(),
        // '/create_items': (context) => CRItemsday21(),
      },
      title: 'Register Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: LoginScreenProject(),
    );
  }
}
