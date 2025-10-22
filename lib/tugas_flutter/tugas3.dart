import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5EFE6),
      appBar: AppBar(
        title: Text(
          "E-Nventory",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff6D94C5),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Anda ..... ",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "E-mail",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan E-mail Anda ..... ",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "No-Hp",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan No-Hp Anda ..... ",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Deskripsikan Diri Anda",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLines: 2,
                  // minLines: 1,
                  // expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: " ..... ",
                  ),
                ),
                SizedBox(height: 12),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Color(0xffCBDCEB),
                      child: Stack(children: [const Text("1")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Color(0xffCBDCEB),
                      child: Stack(children: [const Text("2")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Color(0xffCBDCEB),
                      child: Stack(children: [const Text("3")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Color(0xffCBDCEB),
                      child: Stack(children: [const Text("4")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Color(0xffCBDCEB),
                      child: Stack(children: [const Text("5")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Color(0xffCBDCEB),
                      child: Stack(children: [const Text("6")]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
