import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numbers extends StatefulWidget {
  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  final _player = AudioPlayer();
  String _audio = '';
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.8,
      children: [
        GestureDetector(
          onTap: () {
            _audio = "1";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/1.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "2";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/2.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "3";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/3.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "4";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/4.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "5";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/5.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "6";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/6.png'),
        )
      ],
    );
  }

  void playerAudio(String audio) {
    _player.play(AssetSource('audio/$audio.mp3'));
  }
}
