import 'package:flutter/material.dart';

class Tugas9Kategori extends StatefulWidget {
  const Tugas9Kategori({super.key});
  @override
  State<Tugas9Kategori> createState() => _Tugas9KategoriState();
}

class _Tugas9KategoriState extends State<Tugas9Kategori> {
  final List<Map<String, dynamic>> namaPerabot = [
    {"name": "Buah-buahan", 'icon': Icons.apple},
    {"name": "Sayuran", 'icon': Icons.apple},
    {"name": "Elektronik", 'icon': Icons.apple},
    {"name": "Pakaian Pria", 'icon': Icons.apple},
    {"name": "Pakaian Wanita", 'icon': Icons.apple},
    {"name": "Alat Tulis Kantor", 'icon': Icons.apple},
    {"name": "Buku & Majalah", 'icon': Icons.apple},
    {"name": "Peralatan Dapur", 'icon': Icons.apple},
    {"name": "Makanan Ringan", 'icon': Icons.apple},
    {"name": "Mainan Anak", 'icon': Icons.apple},
    {"name": "Peralatan Olahraga", 'icon': Icons.apple},
    {"name": "Produk Kesehatan", 'icon': Icons.apple},
    {"name": "Kosmetik", 'icon': Icons.apple},
    {"name": "Obat-obatan", 'icon': Icons.apple},
    {"name": "Aksesoris Mobil", 'icon': Icons.apple},
    {"name": "Perabot Rumah", 'icon': Icons.apple},
    {"name": "Sepatu & Sandal", 'icon': Icons.apple},
    {"name": "Barang Bekas", 'icon': Icons.apple},
    {"name": "Voucher & Tiket", 'icon': Icons.apple},
  ];

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
          itemCount: namaPerabot.length,
          itemBuilder: (BuildContext context, int index) {
            final item = namaPerabot[index];
            return ListTile(
              onTap: () {},
              leading: Icon(item["icon"]),
              title: Text(item["name"]),
            );
          },
        ),
      ),
    );
  }
}
