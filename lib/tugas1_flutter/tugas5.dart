import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool showName = false;
  bool showFavorite = false;
  bool showAll = false;
  num counter = 0;
  bool showKotak = false;
  double counter1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF9D1),
      appBar: AppBar(
        title: Text(
          "Tugas 5 Flutter",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff9A3F3F),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xff9A3F3F),
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff9A3F3F),
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: Icon(
              Icons.remove,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            if (showName) ...[
              Text(
                "Yoga Perdana Ferdiansyah",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  print("Tampilkan Nama : $showName");
                  showName = !showName;
                  setState(() {});
                },
                child: Text(showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
              ),
            ] else ...[
              SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  print("Tampilkan Nama : $showName");
                  showName = !showName;
                  setState(() {});
                },
                child: Text(showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
              ),
            ],
            IconButton(
              onPressed: () {
                showFavorite = !showFavorite;
                setState(() {});
              },
              icon: Icon(
                showFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ),
            Text(showFavorite ? "Love You!! <3" : " "),

            //Nomor 3
            SizedBox(
              child: Column(
                children: [
                  Text(
                    showAll
                        ? 'Barang siapa yang bersungguh-sungguh pasti akan berhasil!!!'
                        : '    ',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      showAll = !showAll;
                      setState(() {});
                    },
                    child: Text('Lihat Selengkapnya'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: Text(counter.toString(), style: TextStyle(fontSize: 24)),
              ),
            ),

            //Nomor 5
            InkWell(
              splashColor: Colors.black,
              onTap: () {
                print('Kotak Sentuh');
                setState(() {
                  showKotak = !showKotak;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: 300,
                height: 100,
                color: Color(0xffE6CFA9),
                child: Center(
                  child: Text(
                    showKotak ? '  ' : 'Alhamdulillah ada teks nya',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            //Nomor 6
            SizedBox(height: 100),
            GestureDetector(
              onDoubleTap: () {
                print('Ditekan dua kali');
                setState(() {
                  counter1 += 2;
                });
              },
              onLongPress: () {
                print('Tahan Lama');
                setState(() {
                  counter1 += 3;
                });
              },
              onTap: () {
                print('ditekan sekali');
                setState(() {
                  counter1++;
                });
              },
              child: Text('Ayo Tekan Aku'),
            ),
            Center(child: Text('Jumlahnya : $counter1')),
          ],
        ),
      ),
    );
  }
}
