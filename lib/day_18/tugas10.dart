import 'package:flutter/material.dart';
import 'package:flutter_d7/day_18/drawer.dart';

class LatihanLogin extends StatefulWidget {
  const LatihanLogin({super.key});
  static const id = "/login_screen17";

  @override
  State<LatihanLogin> createState() => _Tugas10State();
}

class _Tugas10State extends State<LatihanLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();

  bool isMata = false; // untuk toggle password visibility
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logoSlicing(1).png',
                      height: 23,
                      width: 23.27,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/logoSlicing.jpeg',
                      height: 18.98,
                      width: 97.16,
                    ),
                  ],
                ),
                SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const Text("Login to access your account"),
                            height(12),
                            buildTitle("Name"),
                            height(8),
                            buildTextField(
                              hintText: "Enter your name",
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Nama tidak boleh kosong";
                                } else if (value.length <= 1) {
                                  return "Nama minimal 1 karakter";
                                }
                                return null;
                              },
                            ),

                            buildTitle("Email Address"),
                            height(8),
                            buildTextField(
                              hintText: "Enter your email",
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email tidak boleh kosong";
                                } else if (!value.contains('@')) {
                                  return "Email tidak valid";
                                } else if (!RegExp(
                                  r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                                ).hasMatch(value)) {
                                  return "Format Email tidak valid";
                                }
                                return null;
                              },
                            ),
                            height(12),
                            buildTitle("Phone Number"),
                            height(8),
                            buildTextField(
                              hintText: "Enter your number",
                              controller: phoneNumberController,
                            ),

                            height(12),
                            buildTitle("Username"),
                            height(8),
                            buildTextField(
                              hintText: "Enter your username",
                              controller: domisiliController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Username tidak boleh kosong";
                                } else if (value.length <= 1) {
                                  return "Username minimal 1 karakter";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Make sure your data is correct',
                                          ),
                                          content: Text(
                                            'Name : ${nameController.text} \nEmail Address : ${emailController.text} \n Phone Number : ${phoneNumberController.text} \n Domicili : ${domisiliController.text}',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop;
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return day18Drawer(
                                                        // name:
                                                        //     nameController.text,
                                                        // domisili:
                                                        //     domisiliController
                                                        //         .text,
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Text("oke"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Validation Error"),
                                          content: const Text(
                                            "Please fill all fields",
                                          ),
                                          actions: [
                                            TextButton(
                                              child: const Text("OK"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text("BATALKAN"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: const Text("Daftar"),
                              ),
                            ),
                            height(16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundSlicing.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? !isMata : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isMata = !isMata;
                  });
                },
                icon: Icon(isMata ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
    );
  }

  SizedBox height(double h) => SizedBox(height: h);
  SizedBox width(double w) => SizedBox(width: w);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}
