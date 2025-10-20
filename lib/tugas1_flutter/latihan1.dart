import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas1_flutter/custom_login_button.dart';

class Latihan1 extends StatefulWidget {
  const Latihan1({super.key});

  @override
  State<Latihan1> createState() => _Latihan1State();
}

class _Latihan1State extends State<Latihan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF9D1),
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 8),
        actions: [
          Icon(
            Icons.more_vert_outlined,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
        title: Text(
          "LATIHAN PROJEK",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff9A3F3F),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          color: Colors.white,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              CustomLoginButton(
                label: 'Masuk ke Tugas 5',
                onPress: () {
                  Navigator.pushNamed(context, '/tugas5');
                },
              ),
              SizedBox(height: 12),
              CustomLoginButton(
                label: 'Masuk ke Tugas 4',
                onPress: () {
                  Navigator.pushNamed(context, '/tugas4');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
