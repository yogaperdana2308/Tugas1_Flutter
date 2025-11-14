import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day31/model/cat_model.dart';
import 'package:flutter_d7/API_day31/service/api.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  late Future<List<CatModel>> _futureCat;

  @override
  void initState() {
    super.initState();
    _futureCat = fetchCat();
  }

  Future<void> _refresh() async {
    setState(() {
      _futureCat = fetchCat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF8FB7),
        title: const Text(
          "🐱 Galeri Kucing",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: FutureBuilder<List<CatModel>>(
        future: _futureCat,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xffFF8FB7)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Terjadi kesalahan: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          final cats = snapshot.data!;

          return RefreshIndicator(
            color: const Color(0xffFF8FB7),
            onRefresh: _refresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: cats.length,
              itemBuilder: (context, index) {
                final cat = cats[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  shadowColor: Colors.pink.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          cat.url ?? '',
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              height: 220,
                              color: Colors.pink.shade50,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xffFF8FB7),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 220,
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 60,
                              ),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ID: ${cat.id ?? '-'}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Wrap(
                              children: [
                                const Icon(
                                  Icons.link,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'URL : ${cat.url ?? ''}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
