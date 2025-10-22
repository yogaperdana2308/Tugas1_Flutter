import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 135, 135),
      appBar: AppBar(
        title: const Text('Profil Saya'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: const Color.fromARGB(255, 218, 112, 104),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Text(
            'Nama : Yoga Perdana Ferdiansyah',
            style: TextStyle(
              color: Color.fromARGB(255, 252, 252, 252),
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Color.fromARGB(255, 255, 0, 0)),
              Text(
                'Jakarta Pusat',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 19,
                ),
              ),
            ],
          ),
          Text(
            '"Jadilah Manusia Yang Berguna"',
            style: TextStyle(
              color: Color.fromARGB(255, 252, 252, 252),
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
