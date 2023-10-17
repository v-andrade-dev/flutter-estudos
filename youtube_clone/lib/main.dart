import 'package:flutter/material.dart';
import 'package:youtube_clone/view/Home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "environment.env");
  runApp(const MaterialApp(
    home: Home(),
  ));
}
