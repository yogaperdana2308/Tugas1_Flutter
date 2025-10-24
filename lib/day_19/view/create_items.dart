import 'package:flutter/material.dart';
import 'package:flutter_d7/day_19/database/db_helper.dart';
import 'package:flutter_d7/day_19/model/user_model.dart';
import 'package:flutter_d7/tugas_flutter/custom_login_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    DbHelper.gettAllItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Text("List Barang", style: TextStyle(fontSize: 24)),
            buildTextField(hintText: "Username", controller: usernameC),
            buildTextField(hintText: "Email", controller: emailC),
            buildTextField(hintText: "Password", controller: passwordC),
            buildTextField(hintText: "No.HP", controller: nomorhpC),
            buildTextField(hintText: "Price", controller: emailC),
            buildTextField(hintText: "Items", controller: barangC),
            CustomLoginButton(
              label: "Tambahkan",
              onPress: () {
                if (usernameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Username belum diisi");
                } else if (emailC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Email belum diisi");
                } else if (passwordC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Password belum diisi");
                } else if (nomorhpC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "No Hp belum diisi");
                } else if (priceC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Harga belum diisi");
                } else if (barangC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Items belum diisi");
                } else {
                  final UserModel dataUser = UserModel(
                    username: usernameC.text,
                    email: emailC.text,
                    password: passwordC.text,
                    nomorhp: int.parse(nomorhpC.text),
                    price: int.parse(priceC.text),
                    barang: barangC.text,
                  );
                  DbHelper.createItems(dataUser).then((value) {
                    usernameC.clear();
                    emailC.clear();
                    passwordC.clear();
                    nomorhpC.clear();
                    priceC.clear();
                    barangC.clear();
                    getData();
                    Fluttertoast.showToast(msg: "Data berhasil ditambahkan");
                  });
                }
              },
            ),
            SizedBox(height: 30),
            FutureBuilder(
              future: DbHelper.gettAllItems(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
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
                              title: Text(items.barang ?? " "),
                              subtitle: Text(items.price.toString()),
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
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
