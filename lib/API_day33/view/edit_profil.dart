import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day33/models/login_model.dart';

class EditProfilePage extends StatefulWidget {
  final User? user;

  const EditProfilePage({super.key, this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameC;
  late TextEditingController emailC;

  @override
  void initState() {
    super.initState();
    nameC = TextEditingController(text: widget.user?.name);
    emailC = TextEditingController(text: widget.user?.email);
  }

  @override
  void dispose() {
    nameC.dispose();
    emailC.dispose();
    super.dispose();
  }

  void saveProfile() {
    if (!formKey.currentState!.validate()) return;

    // Jika ada API untuk update profile, tambahkan di sini.
    // Sementara local update saja.
    widget.user?.copyWith(name: nameC.text, email: emailC.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profil berhasil diperbarui!")),
    );

    Navigator.pop(context); // kembali ke profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF2C6),
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xffFFF2C6),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameC,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (v) => v!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),

              // const SizedBox(height: 16),
              // TextFormField(
              //   controller: emailC,
              //   decoration: InputDecoration(
              //     labelText: "Email",
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   validator: (v) =>
              //       v!.isEmpty ? "Email tidak boleh kosong" : null,
              // ),
              const Spacer(),

              ElevatedButton(
                onPressed: saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
