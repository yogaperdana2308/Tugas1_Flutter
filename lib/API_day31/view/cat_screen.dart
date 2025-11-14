import 'package:flutter/material.dart';
import 'package:flutter_d7/API_day31/model/cat_model.dart';
import 'package:flutter_d7/API_day31/service/api.dart';
import 'package:flutter_d7/API_day31/view/detail_cat.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  late Future<List<CatModel>> _futureCat;

  List<CatModel> _originalCats = [];
  List<CatModel> _filteredCats = [];

  final TextEditingController _searchController = TextEditingController();

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

  void _search(String query) {
    if (query.isEmpty) {
      setState(() => _filteredCats = _originalCats);
    } else {
      setState(() {
        _filteredCats = _originalCats
            .where((cat) => cat.id!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Cat Gallery",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // 🔍 Search Bar Premium Style
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _search,
                decoration: InputDecoration(
                  hintText: "Search by ID...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<CatModel>>(
              future: _futureCat,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.pink),
                  );
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Tidak ada data"));
                }

                _originalCats = snapshot.data!;
                _filteredCats = _filteredCats.isEmpty
                    ? _originalCats
                    : _filteredCats;

                return RefreshIndicator(
                  onRefresh: _refresh,
                  color: Colors.pink,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),

                    itemCount: _filteredCats.length,
                    itemBuilder: (context, index) {
                      final cat = _filteredCats[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailCatScreen(cat: cat),
                            ),
                          );
                        },
                        child: Hero(
                          tag: cat.id!,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 14,
                                  offset: const Offset(0, 6),
                                  color: Colors.black.withOpacity(0.07),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      cat.url!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // ID label floating
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.6),
                                            Colors.transparent,
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      child: Text(
                                        "ID: ${cat.id}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
