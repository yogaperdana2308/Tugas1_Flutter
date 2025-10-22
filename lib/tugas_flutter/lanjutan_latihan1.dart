import 'package:flutter/material.dart';

class LanjutanLatihan1 extends StatelessWidget {
  const LanjutanLatihan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 135, 135),
      appBar: AppBar(
        title: const Text('Profil Saya'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: const Color.fromARGB(255, 218, 112, 104),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              'Berasnya Habis, Beli Yang Lain!!!!',
              style: TextStyle(
                color: Color.fromARGB(255, 252, 252, 252),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
