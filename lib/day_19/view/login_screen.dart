import 'package:flutter/material.dart';
import 'package:flutter_d7/day_18/splash_screen_handler.dart';
import 'package:flutter_d7/day_19/database/db_helper.dart';
import 'package:flutter_d7/day_19/view/create_items.dart';
import 'package:flutter_d7/tugas_flutter/custom_login_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool buttonAll = false;
  bool box = false;
  bool obscurePass = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/backgroundSlicing.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logoSlicing(1).png',
                      height: 23,
                      width: 23.27,
                    ),
                    Image.asset(
                      'assets/images/logoSlicing.jpeg',
                      height: 18.98,
                      width: 97.16,
                    ),
                  ],
                ),
                SizedBox(height: 26),
                Container(
                  height: 650,
                  width: 327,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Get Started now',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Create an account or log in to explore out app',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 24),
                      CustomLoginButton(
                        label: 'Sign In With Google',
                        imagePath: 'assets/images/logoGoogle.png',
                      ),
                      SizedBox(height: 12),
                      CustomLoginButton(
                        label: 'Sign In With Facebook',
                        imagePath: 'assets/images/logoFacebook.png',
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 209, 209, 209),
                              endIndent: 16,
                              height: 9,
                            ),
                          ),
                          Text('Or'),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 16,
                              color: Color.fromARGB(255, 209, 209, 209),
                              height: 9,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                label: Text('Email'),
                                hintText: 'Email',
                              ),
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
                            SizedBox(height: 24),
                            TextFormField(
                              controller: passwordController,
                              obscureText: isPassword ? isVisibility : false,
                              decoration: InputDecoration(
                                label: Text('Password'),
                                suffixIcon: isPassword
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisibility = !isVisibility;
                                          });
                                        },
                                        icon: Icon(
                                          isVisibility
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      )
                                    : null,
                              ),

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password tidak boleh kosong";
                                } else if (value.length < 6) {
                                  return "Password minimal 6 karakter";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30,
                                child: IconButton(
                                  onPressed: () {
                                    box = !box;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    size: 18,
                                    box
                                        ? Icons.check_box_rounded
                                        : Icons.check_box_outline_blank,
                                  ),
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: 12),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4D81E7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomLoginButton(
                            label: 'LOGIN',

                            isLogin: true,
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                print(emailController.text);
                                PreferenceHandler.saveLogin(true);

                                final data = await DbHelper.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                print(data?.toJson());
                                if (data != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CRItems(),
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Email atau password salah",
                                  );
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Validation Error"),
                                      content: Text("Please fill all fields"),
                                      actions: [
                                        TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Batalkan"),
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
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register_screen');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFF4D81E7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Dont have an account?',
                //       style: TextStyle(color: Colors.grey),
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Sign Up',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 12,
                //           color: Color(0xFF4D81E7),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
