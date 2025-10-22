import 'package:flutter/material.dart';
import 'package:flutter_d7/constant/perabot_image.dart';
import 'package:flutter_d7/extension/rupiah.dart';
import 'package:flutter_d7/models/perabot_model.dart';

// NOMOR 3
class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});
  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  final List<perabotModel> namaPerabot = [
    perabotModel(name: "Baskom", price: 7000, image: AppImages.baskom),
    perabotModel(name: "Baskom", price: 7000, image: AppImages.baskom),
    perabotModel(name: "Ember", price: 10000, image: AppImages.ember),
    perabotModel(name: "Garpu", price: 15000, image: AppImages.garpu),
    perabotModel(name: "Gayung", price: 8000, image: AppImages.gayung),
    perabotModel(name: "Kain Pel", price: 60000, image: AppImages.kainpel),
    perabotModel(name: "Panci", price: 100000, image: AppImages.panci),
    perabotModel(name: "Pengki", price: 25000, image: AppImages.pengki),
    perabotModel(name: "Sapu Ijuk", price: 30000, image: AppImages.sapuIjuk),
    perabotModel(name: "Sendok", price: 15000, image: AppImages.sendok),
    perabotModel(name: "Spatula", price: 20000, image: AppImages.spatula),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9A3F3F),
        title: Text('Jual Perabotan', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color(0xffE6CFA9),
      body: ListView.builder(
        itemCount: namaPerabot.length,
        itemBuilder: (BuildContext context, int index) {
          final item = namaPerabot[index];
          return ListTile(
            onTap: () {},
            tileColor: item.backgroundColor,
            leading: Image.asset(item.image, width: 60),
            title: Text(item.name),
            subtitle: Text(item.price.toString().toRPCurrency()),
          );
        },
      ),
    );
  }
}
