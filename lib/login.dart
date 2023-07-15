// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trashbanker/data/model/sampah.dart';
import 'package:trashbanker/data/repository/SampahRepository.dart';
import 'package:trashbanker/di/get_it.dart';
import 'register.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SampahRepository _sampahRepository = locator<SampahRepository>();

  String user = 'atafatta';
  String password = 'atafatta';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    String inputUsername = usernameController.text;
    String inputPassword = passwordController.text;

    if (inputUsername == user && inputPassword == password) {
      // Berhasil login, alihkan ke halaman dashboard dengan mengirimkan data nama pengguna
      // _sampahRepository.initializeData(inputUsername);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: inputUsername),
        ),
      );
    } else {
      // Gagal login, tampilkan pesan atau lakukan tindakan lainnya
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Username atau password salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
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
            width: 150,
            height: 200,
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
                      'Login',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 31, 121, 34),
                          foregroundColor: Colors.white,
                          minimumSize: Size(152, 38)),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Belum Punya Akun ',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Daftar',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.yellow,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    )
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
