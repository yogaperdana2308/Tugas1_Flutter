// import 'package:delightful_toast/delight_toast.dart';
// import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

//NOMOR 1
class Tugas9List extends StatefulWidget {
  const Tugas9List({super.key});
  @override
  State<Tugas9List> createState() => _Tugas9ListState();
}

class _Tugas9ListState extends State<Tugas9List> {
  final List<String> kategori = ["Kain Pel", "Pengki", "Sapu Ijuk"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9A3F3F),
        title: Text('Jual Perabotan', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color(0xffE6CFA9),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: kategori.length,
          itemBuilder: (BuildContext context, int index) {
            final item = kategori[index];
            return ListTile(title: Text(kategori[index]));
          },
        ),
      ),
    );
  }
}
