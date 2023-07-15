// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_init_to_null, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:trashbanker/data/model/sampah.dart';
import 'mitra.dart';
import 'login.dart';
class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  void logout(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout(BuildContext context) {
    Navigator.pop(context);
  }

  String? selectedValue = null; // Set initial value to null for placeholder
  double price = 0;
  double weight = 0;
  double jumlah = 0; // Added jumlah variable
  String nama = "";
  late Sampah sampah;

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(
      value: null, // Set value to null for placeholder
      child: Text(
        'Pilih kategori',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Organik',
      child: Text('Organik'),
    ),
    DropdownMenuItem(
      value: 'Anorganik',
      child: Text('Anorganik'),
    ),
  ]; // Added dropdownItems list

  void calculateJumlah() {
    jumlah = weight * price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 155, 48),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 26, right: 26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Halo ${widget.username}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                    child: Text(
                      'LogOut',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Silahkan Masukkan Data Sampahmu Disini',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        onChanged: (value) => nama = value,
                        decoration: InputDecoration(
                          labelText: 'Nama Sampah',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            if (selectedValue == 'Organik') {
                              price = 3000;
                            } else if (selectedValue == 'Anorganik') {
                              price = 6000;
                            }
                          });
                        },
                        items: dropdownItems,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Berat Sampah (kg)',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            weight = double.tryParse(value) ?? 0;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Rp. ${price.toInt()}',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                        enabled: false,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity, // Set width to full
                        child: ElevatedButton(
                          onPressed: () {
                            calculateJumlah(); // Calculate jumlah before navigating
                            sampah = Sampah(nama: nama, kategori: selectedValue ?? "Organik", berat: weight);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MitraPage(username: widget.username, sampah: sampah), // Pass the jumlah to MitraPage
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 31, 121, 34),
                              foregroundColor: Colors.white,
                              minimumSize: Size(152, 38)),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
