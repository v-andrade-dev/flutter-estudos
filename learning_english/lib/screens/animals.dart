import 'package:flutter/material.dart';

class Animals extends StatefulWidget {
  @override
  _AnimalsState createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.8,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/cao.png'),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/gato.png'),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/leao.png'),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/macaco.png'),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/ovelha.png'),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/vaca.png'),
        )
      ],
    );
  }
}
