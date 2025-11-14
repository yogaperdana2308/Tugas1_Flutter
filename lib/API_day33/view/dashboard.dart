import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day33/models/login_model.dart';
import 'package:flutter_d7/API_day33/view/detail_profil.dart';
import 'package:flutter_d7/API_day33/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatelessWidget {
  final User? user;
  const DashboardPage({super.key, this.user});

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color(0xffFFF2C6),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage(user: user)),
              );
            },
            icon: Icon(Icons.account_circle, size: 28, color: Colors.black),
          ),
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout_rounded, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 16),
            Text(
              user?.name ?? "-",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(user?.email ?? "-", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
