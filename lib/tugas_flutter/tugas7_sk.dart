import 'package:flutter/material.dart';
import 'package:flutter_d7/tugas_flutter/tugas7_drawer.dart';
import 'package:intl/intl.dart';

// ~~~~ CHECK BOX ~~~~
class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool isChecked = false;

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched ? Colors.black : Color(0xffFBF9D1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('Syarat dan Ketentuan', style: TextStyle(fontSize: 24)),
              Divider(),
              SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      isChecked
                          ? "Lanjutkan pendaftaran diperbolehkan"
                          : "Saya menyetujui semua persyaratan yang berlaku",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: isChecked
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login berhasil!")),
                        );
                      }
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Anda Belum Menyetujui")),
                        );
                      },
                child: Text("Login"),
              ),
              Divider(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ~~~~ SWITCH ~~~~
class Tugas7Switch extends StatefulWidget {
  const Tugas7Switch({super.key});

  @override
  State<Tugas7Switch> createState() => _Tugas7SwitchState();
}

class _Tugas7SwitchState extends State<Tugas7Switch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched ? Colors.black : Color(0xffFBF9D1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Text(
                isSwitched ? "On" : "Off",
                style: TextStyle(
                  color: isSwitched ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//~~~~ DROP DOWN ~~~~
class Tugas7Dropdown extends StatefulWidget {
  const Tugas7Dropdown({super.key});

  @override
  State<Tugas7Dropdown> createState() => _Tugas7DropdownState();
}

class _Tugas7DropdownState extends State<Tugas7Dropdown> {
  String? dropDownValue;
  final List<String> listColor = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF9D1),
      body: Column(
        children: [
          DropdownButton(
            value: dropDownValue,
            items: listColor.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val, style: TextStyle(color: Colors.black)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropDownValue = value;
              });
              print(dropDownValue);
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Anda memilih kategori : ${dropDownValue ?? '....'} "),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//DATE PICKER
class Tugas7DatePicker extends StatefulWidget {
  const Tugas7DatePicker({super.key});

  @override
  State<Tugas7DatePicker> createState() => _Tugas7DatePickerState();
}

class _Tugas7DatePickerState extends State<Tugas7DatePicker> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(selectedPicked.toString()),
          Text(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            DateFormat('EEEE, dd MMMM yyyy', "id_ID").format(selectedPicked!),
          ),

          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
              );
              if (picked != null) {
                print(picked);
                setState(() {
                  selectedPicked = picked;
                });
              }
            },
            child: Text("Pilih Tanggal"),
          ),
        ],
      ),
    );
  }
}

//TIME PICKER
class Tugas7TimePicker extends StatefulWidget {
  const Tugas7TimePicker({super.key});

  @override
  State<Tugas7TimePicker> createState() => _Tugas7TimePickerState();
}

class _Tugas7TimePickerState extends State<Tugas7TimePicker> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Jam"),
        ),
      ],
    );
  }
}

//Tugas 8 CusNav Bottom
class Tugas7BotNav extends StatefulWidget {
  const Tugas7BotNav({super.key});

  @override
  State<Tugas7BotNav> createState() => _BottomNavCustomDay15State();
}

class _BottomNavCustomDay15State extends State<Tugas7BotNav> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Tugas7Drawer(),
    Tugas7Switch(),
    Tugas7Dropdown(),
    Tugas7DatePicker(),
    Tugas7TimePicker(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffE6CFA9),
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.warning, color: Colors.red),
            label: "Attention",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
