import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day31/model/cat_model.dart';

class DetailCatScreen extends StatelessWidget {
  final CatModel cat;
  const DetailCatScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Column(
        children: [
          Hero(
            tag: cat.id!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                cat.url!,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                  color: Colors.black.withOpacity(0.08),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Cat ID: ${cat.id}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _infoBox("Width", "${cat.width} px"),
                    _infoBox("Height", "${cat.height} px"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
