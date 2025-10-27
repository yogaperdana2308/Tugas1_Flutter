import 'package:flutter/material.dart';
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
