import 'package:flutter/material.dart';

class InputAkun extends StatelessWidget {
  const InputAkun({
    super.key,
    required this.input,
    this.obscurePass = false,
    this.whenPress,
    this.lambang,
    this.isPassword = false,
  });
  final String input;
  final bool obscurePass;
  final void Function()? whenPress;
  final Widget? lambang;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscurePass,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: input,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: whenPress,
                // icon: lambang ?? SizedBox(),
                icon: obscurePass
                    ? Icon(Icons.visibility_off_outlined, size: 16)
                    : Icon(Icons.visibility_outlined, size: 16),
              )
            : null,
      ),
    );
  }
}
