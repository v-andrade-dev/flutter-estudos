import 'package:flutter/material.dart';
import 'package:learning_english/screens/animals.dart';
import 'package:learning_english/screens/numbers.dart';
import 'package:learning_english/screens/vowels.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.brown,
          title: const Center(
              child: Text(
            "Aprenda Inglês",
            style: TextStyle(fontSize: 20),
          )),
          bottom: TabBar(
              controller: _tabController,
              indicatorWeight: 4,
              indicatorColor: Colors.white,
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "Animais",
                ),
                Tab(
                  text: "Números",
                ),
                Tab(
                  text: "Vogais",
                )
              ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Animals(),
            Numbers(),
            Vowels(),
          ],
        ));
  }
}
