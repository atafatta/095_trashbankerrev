// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_init_to_null, sized_box_for_whitespace, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'home.dart';
class FinishPage extends StatefulWidget {
  final double jumlah;
  final String username;

  FinishPage({required this.jumlah,required this.username});
  @override
  _MitraPageState createState() => _MitraPageState();
}

class _MitraPageState extends State<FinishPage> {

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'SELAMAT KAMU MENDAPAT RP. ${widget.jumlah.toInt()} DARI SAMPAH KAMU LOH',
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
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(username: widget.username),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 31, 121, 34),
                            foregroundColor: Colors.white,
                            minimumSize: Size(152, 38),
                          ),
                          child: Text(
                            'Kembali',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
