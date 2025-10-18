import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8,
        children: [
          SizedBox(height: 72, width: double.infinity),
          Text(
            'Login',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.door_back_door_outlined,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              Text(
                'Silahkan Login',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 19,
                ),
              ),
            ],
          ),
          Text(
            '"Jadilah Manusia Yang Berguna"',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
