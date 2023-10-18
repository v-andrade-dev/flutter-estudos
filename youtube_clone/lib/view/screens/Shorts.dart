import 'package:flutter/material.dart';

class Shorts extends StatefulWidget {
  const Shorts({super.key});

  @override
  _ShortsState createState() => _ShortsState();
}

class _ShortsState extends State<Shorts> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
            child: Text("Shorts", style: TextStyle(fontSize: 25))));
  }
}
