import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Vowels extends StatefulWidget {
  @override
  _VowelsState createState() => _VowelsState();
}

class _VowelsState extends State<Vowels> {
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
            _audio = "a";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/a.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "e";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/e.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "i";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/i.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "o";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/o.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "u";
            playerAudio(_audio);
          },
          child: Image.asset('assets/images/u.png'),
        )
      ],
    );
  }

  void playerAudio(String audio) {
    _player.play(AssetSource('audio/$audio.mp3'));
  }
}
