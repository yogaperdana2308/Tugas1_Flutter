import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas_flutter/tugas9.dart';
import 'package:flutter_d7/tugas_flutter/tugas9b.dart';
import 'package:flutter_d7/tugas_flutter/tugas9c.dart';

class Tugas9Drawer extends StatefulWidget {
  const Tugas9Drawer({super.key, required this.email});
  final email;

  @override
  State<Tugas9Drawer> createState() => _Tugas9DrawerState();
}

class _Tugas9DrawerState extends State<Tugas9Drawer> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Tugas9List(),
    Tugas9Kategori(),
    Tugas9(),
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
          "Tugas 9 Flutter",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff9A3F3F),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xffFBF9D1),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Yoga Perdana Ferdiansyah'),
              accountEmail: Text(
                'yoga.perdana124@gmail.com',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              decoration: BoxDecoration(color: Color(0xff9A3F3F)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/backgroundSlicing.jpeg',
                ),
              ),
            ),
            // SizedBox(height: 4),
            // // Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              title: Text('List Barang'),
              leading: Icon(Icons.clean_hands_rounded, color: Colors.red),
            ),
            Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              title: Text('Kategori Barang'),
              leading: Icon(Icons.fastfood_rounded, color: Colors.lightGreen),
            ),
            Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              title: Text('Barang'),
              leading: Icon(Icons.fastfood_rounded, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
      body: _widgetOptions[selectedIndex],
    );
  }
}
