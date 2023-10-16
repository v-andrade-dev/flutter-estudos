import 'package:flutter/material.dart';
import 'package:youtube_clone/view/screens/Shorts.dart';
import 'package:youtube_clone/view/screens/Start.dart';
import 'package:youtube_clone/view/screens/Subscriptions.dart';
import 'package:youtube_clone/view/screens/Trending.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Start(),
      const Shorts(),
      const Trending(),
      const Subscriptions(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: screens[_navIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: "Shorts"),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: "Em alta"),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: "Inscrições"),
        ],
      ),
    );
  }
}
