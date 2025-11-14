import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day33/models/login_model.dart';
import 'package:flutter_d7/API_day33/view/edit_profil.dart';

class ProfilePage extends StatelessWidget {
  final User? user;

  const ProfilePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Profil Saya", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 45, child: Icon(Icons.person, size: 60)),
            const SizedBox(height: 20),

            Text(
              user?.name ?? "-",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(user?.email ?? "-", style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),
            const Divider(),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 10),
                Text(
                  "Dibuat: ${user?.createdAt?.toLocal().toString().substring(0, 10) ?? "-"}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfilePage(user: user),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
