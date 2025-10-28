import 'package:flutter/material.dart';
import 'package:flutter_d7/day_19/buildtextfield.dart';
import 'package:flutter_d7/day_19/database/db_helper.dart';
import 'package:flutter_d7/day_19/model/user_model.dart';

class CRItems extends StatefulWidget {
  const CRItems({super.key});

  @override
  State<CRItems> createState() => _CRItemsStates();
}

class _CRItemsStates extends State<CRItems> {
  final usernameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final nomorhpC = TextEditingController();
  final priceC = TextEditingController();
  final barangC = TextEditingController();

  getData() {
    DbHelper.gettAllUser();
    setState(() {});
  }

  Future<void> _onEdit(UserModel user) async {
    final editNameC = TextEditingController(text: user.username);
    final editEmailC = TextEditingController(text: user.email);
    final editPassC = TextEditingController(text: user.password);
    final editNoHpC = TextEditingController(text: user.nomorhp);
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Textfield(nama: "Name", controler: editNameC),
              Textfield(nama: "Email", controler: editEmailC),
              Textfield(nama: "No HP", controler: editNoHpC),
              Textfield(nama: "Password", controler: editPassC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = UserModel(
        id: user.id,
        username: editNameC.text,
        email: editEmailC.text,
        password: editPassC.text,
        nomorhp: editNoHpC.text,
      );
      DbHelper.updateStudent(updated);
      getData();
      ScaffoldMessenger(child: Text("data berhasil di perbarui"));
      // Fluttertoast.showToast(msg: "Data berhasil di update");
    }
  }

  Future<void> _onDelete(UserModel user) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${user.username}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Jangan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus aja"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DbHelper.deleteStudent(user.id!);
      getData();
      ScaffoldMessenger(child: Text("data berhasil di hapus"));
      // Fluttertoast.showToast(msg: "Data berhasil di hapus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List User")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            // child: Text("List data user:"),
          ),
          FutureBuilder(
            future: DbHelper.gettAllUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.data == null) {
                return Text("Data tidak ada");
              } else {
                final data = snapshot.data as List<UserModel>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final items = data[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(items.username ?? ''),
                            subtitle: Text(items.email ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _onEdit(items);
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _onDelete(items);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
