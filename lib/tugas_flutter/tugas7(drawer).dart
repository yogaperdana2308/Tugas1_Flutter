import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas_flutter/tugas7(sk).dart';

class Tugas7Drawer extends StatefulWidget {
  const Tugas7Drawer({super.key});

  @override
  State<Tugas7Drawer> createState() => _Tugas7DrawerState();
}

class _Tugas7DrawerState extends State<Tugas7Drawer> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Tugas7(),
    Tugas7Switch(),
    Tugas7Dropdown(),
    Tugas7DatePicker(),
    Tugas7TimePicker(),
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
          "Tugas 7 Flutter",
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
              title: Text('Syarat dan Ketentuan'),
              leading: Icon(Icons.receipt, color: Colors.red),
            ),
            Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              title: Text('Switched'),
              leading: Icon(Icons.refresh_rounded, color: Colors.lightGreen),
            ),
            Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              title: Text('Drop Down'),
              leading: Icon(Icons.arrow_downward_rounded, color: Colors.black),
            ),
            Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              title: Text('Date Picker'),
              leading: Icon(Icons.date_range_rounded),
            ),
            Divider(color: const Color.fromARGB(255, 141, 141, 141), indent: 2),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              title: Text('Time Picker'),
              leading: Icon(Icons.timelapse_outlined),
            ),
          ],
        ),
      ),
      body: _widgetOptions[selectedIndex],
    );
  }
}
