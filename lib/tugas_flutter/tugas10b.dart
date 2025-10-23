import 'package:flutter/material.dart';

class Tugas10b extends StatelessWidget {
  const Tugas10b({super.key, required this.name, required this.domisili});
  final name;
  final domisili;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Terima Kasih $name dari $domisili')],
        ),
      ),
    );
  }
}
