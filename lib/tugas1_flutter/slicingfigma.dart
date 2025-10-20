import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas1_flutter/custom_login_button.dart';
import 'package:flutter_d7/tugas1_flutter/input_akun.dart';

class Slicingfigma extends StatefulWidget {
  const Slicingfigma({super.key});

  @override
  State<Slicingfigma> createState() => _SlicingfigmaState();
}

class _SlicingfigmaState extends State<Slicingfigma> {
  bool buttonAll = false;
  bool box = false;
  bool obscurePass = true;
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
          Column(
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
                height: 612,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        Text('Email'),
                        SizedBox(height: 2),
                        InputAkun(input: 'Email'),
                        SizedBox(height: 24),
                        Text('Password'),
                        SizedBox(height: 2),
                        InputAkun(
                          isPassword: true,
                          input: 'Password',
                          lambang: Icon(Icons.visibility_off_rounded, size: 16),
                          obscurePass: obscurePass,
                          whenPress: () {
                            setState(() {
                              obscurePass = !obscurePass;
                            });
                          },
                        ),
                      ],
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
                            Text('Remember me', style: TextStyle(fontSize: 12)),
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
                        CustomLoginButton(label: 'LOGIN', isLogin: true),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
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
        ],
      ),
    );
  }
}
