import 'package:flutter/material.dart';
import 'package:flutter_d7/day_19/view/create_items.dart';
import 'package:flutter_d7/day_19/view/login_screen.dart';
import 'package:flutter_d7/day_19/view/register_screen.dart';

class ItemsDrawer extends StatefulWidget {
  const ItemsDrawer({super.key});

  @override
  State<ItemsDrawer> createState() => _ItemsDrawerState();
}

class _ItemsDrawerState extends State<ItemsDrawer> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    LoginScreen(),
    RegisterScreen(),
    CRItems(),
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
