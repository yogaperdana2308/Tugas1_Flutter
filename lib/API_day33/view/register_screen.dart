import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day33/services/api.dart';
import 'package:flutter_d7/API_day33/view/login_screen.dart';
import 'package:flutter_d7/API_day33/widget/login_akun.dart';
import 'package:flutter_d7/API_day33/widget/login_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidePass = true;

  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  Future<void> handleRegister() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      final result = await AuthAPI.registerUser(
        name: nameC.text,
        email: emailC.text,
        password: passC.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message ?? "Registrasi berhasil")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Register Akun", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              LoginAkun(
                input: "Nama",
                icon: Icons.person,
                controller: nameC,
                validator: (v) => v!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              SizedBox(height: 16),
              LoginAkun(
                input: "Email",
                icon: Icons.email,
                controller: emailC,
                validator: (v) => v!.isEmpty ? "Email wajib diisi" : null,
              ),
              const SizedBox(height: 16),
              LoginAkun(
                input: "Password",
                isPassword: true,
                obscurePass: hidePass,
                icon: Icons.lock_outline,
                controller: passC,
                whenPress: () => setState(() => hidePass = !hidePass),
                validator: (v) => v!.isEmpty ? "Password wajib diisi" : null,
              ),
              const SizedBox(height: 30),

              LoginButton(
                label: loading ? "Loading..." : "Daftar",
                isLogin: true,
                onPress: loading ? null : handleRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
