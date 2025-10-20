import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas1_flutter/latihan1.dart';
import 'package:flutter_d7/tugas1_flutter/slicingfigma.dart';
import 'package:flutter_d7/tugas1_flutter/tugas4.dart';
import 'package:flutter_d7/tugas1_flutter/tugas5.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({super.key});

  @override
  State<LatihanDrawer> createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Slicingfigma(),
    Tugas4(),
    Latihan1(),
    Tugas5(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF9D1),
      appBar: AppBar(
        title: Text(
          "E-Nventory",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff9A3F3F),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _widgetOptions.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                onTapDrawer(index);
              },
              title: Text('Data ${index + 1}'),
              subtitle: Text('deskripsi Data ${index + 1}'),
            );
          },
        ),
      ),

      body: _widgetOptions[selectedIndex],

      // ListView(
      //   physics: BouncingScrollPhysics(),
      //   children: [
      //     SizedBox(height: 12),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             "Nama",
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(),
      //               hintText: "Masukkan Nama Anda ..... ",
      //             ),
      //           ),
      //           SizedBox(height: 12),
      //           Text(
      //             "E-mail",
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),

      //           TextField(
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(),
      //               hintText: "Masukkan E-mail Anda ..... ",
      //             ),
      //           ),
      //           SizedBox(height: 12),
      //           Text(
      //             "No-Hp",
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(),
      //               hintText: "Masukkan No-Hp Anda ..... ",
      //             ),
      //           ),
      //           SizedBox(height: 12),
      //           Text(
      //             "Deskripsikan Diri Anda",
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             maxLines: 2,
      //             // minLines: 1,
      //             // expands: true,
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(),
      //               hintText: " ..... ",
      //             ),
      //           ),

      //           //Daftar Barang
      //           SizedBox(height: 10),
      //           ListTile(
      //             //Beras
      //             tileColor: Color(0xffE6CFA9),
      //             leading: CircleAvatar(
      //               backgroundImage: AssetImage("assets/images/beras2.jpeg"),
      //             ),
      //             title: Text(
      //               'Beras',
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               'Rp 15.000/liter',
      //               style: TextStyle(fontStyle: FontStyle.italic),
      //             ),
      //             trailing: IconButton(
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/lanjutan1');
      //               },
      //               icon: Icon(Icons.keyboard_arrow_right),
      //             ),
      //           ),

      //           //KOPI ABC
      //           ListTile(
      //             leading: CircleAvatar(
      //               backgroundImage: AssetImage("assets/images/kopiABC.jpeg"),
      //             ),
      //             title: Text(
      //               'Kopi ABC',
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               'Rp 2.000/saset',
      //               style: TextStyle(fontStyle: FontStyle.italic),
      //             ),
      //             trailing: Icon(Icons.keyboard_arrow_right),
      //           ),

      //           //Gula Pasir
      //           ListTile(
      //             tileColor: Color(0xffE6CFA9),
      //             leading: CircleAvatar(
      //               backgroundImage: AssetImage("assets/images/gulaPasir.jpeg"),
      //             ),
      //             title: Text(
      //               'Gula Pasir',
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               'Rp 17.500/kg',
      //               style: TextStyle(fontStyle: FontStyle.italic),
      //             ),
      //             trailing: Icon(Icons.keyboard_arrow_right),
      //           ),

      //           //Sabun Mandi Cair
      //           ListTile(
      //             leading: CircleAvatar(
      //               backgroundImage: AssetImage("assets/images/sabunCair.jpeg"),
      //             ),
      //             title: Text(
      //               'Sabun Mandi Cair',
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               'Rp 15.000/pcs',
      //               style: TextStyle(fontStyle: FontStyle.italic),
      //             ),
      //             trailing: Icon(Icons.keyboard_arrow_right),
      //           ),

      //           //Shampoo
      //           ListTile(
      //             tileColor: Color(0xffE6CFA9),
      //             leading: CircleAvatar(
      //               backgroundImage: AssetImage("assets/images/shampo.jpeg"),
      //             ),
      //             title: Text(
      //               'Shampoo',
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               'Rp 11.000/pcs',
      //               style: TextStyle(fontStyle: FontStyle.italic),
      //             ),
      //             trailing: Icon(Icons.keyboard_arrow_right),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
