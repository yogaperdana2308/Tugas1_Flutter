import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text('Profil Lengkap'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: const Color.fromARGB(255, 218, 112, 104),
      ),

      // Baris Ke-1
      body: Padding(
        padding: const EdgeInsets.all(10.6),
        child: Column(
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/image1.jpeg'),
              radius: 90,
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'Yoga Perdana Ferdiansyah',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                ),
              ),
            ),

            // Baris ke-2
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.mark_email_read_outlined,
                    color: Color.fromARGB(255, 255, 0, 0),
                    size: 20,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  'yogaperdana@gmail.com',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            // Baris ke-3
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_callback,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '081234567789',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),

            // Baris ke- 4
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    margin: EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 165, 114, 101),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 153, 153, 153),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Postingan',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    margin: EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 15, 3, 121),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 153, 153, 153),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Followers',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Baris ke-5
            SizedBox(height: 10),
            Container(
              height: 325,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 58, 58, 58),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 153, 153, 153),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 19,
                ),
                'Saya merupakan peserta pelatihan PPKD Jakarta Pusat Tahun 2025',
              ),
            ),

            // Baris ke-6
            Spacer(),
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 218, 112, 104),
                    Color.fromARGB(255, 48, 203, 250),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
