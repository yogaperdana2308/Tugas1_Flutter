import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day31/view/cat_screen.dart';
import 'package:flutter_d7/day_18/splash_screen_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();

      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CatScreen()),
          (route) => false,
        );
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFF8FB7), Color(0xffF8F4EC)],
          ),
        ),
        // Biar full tinggi layar
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/logokucing1.png')),
          ],
        ),
      ),
    );
  }
}
