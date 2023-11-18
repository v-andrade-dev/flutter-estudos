import 'package:flutter/material.dart';
import './screens/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        primaryColor: Colors.brown,
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff795548)),
        scaffoldBackgroundColor: const Color(0xfff5e9b9)),
  ));
}
