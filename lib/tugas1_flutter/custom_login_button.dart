import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final String? imagePath;
  final String label;
  final bool isLogin;

  const CustomLoginButton({
    super.key,
    this.imagePath,
    required this.label,
    this.isLogin = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isLogin ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color.fromARGB(255, 216, 216, 216)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null) Image.asset(imagePath!, height: 18, width: 18),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isLogin ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
