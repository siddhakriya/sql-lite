import 'package:flutter/material.dart';
import 'uihome.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tambahkan Daftar',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Home(),
    );
  }
}