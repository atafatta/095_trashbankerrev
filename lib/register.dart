// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          SizedBox(
            width: 100,
            height: 145,
            child: Image.asset('assets/images/people.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                  topRight: Radius.circular(28.0),
                ),
                color: Color.fromARGB(255, 45, 155, 48),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 26, right: 26),
                child: ListView(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nama',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Alamat',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 31, 121, 34),
                          foregroundColor: Colors.white,
                          minimumSize: Size(152, 38)),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
