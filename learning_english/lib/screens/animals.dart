import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Animals extends StatefulWidget {
  @override
  _AnimalsState createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  final _player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _audio = '';
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.8,
      children: [
        GestureDetector(
          onTap: () {
            _audio = "cao";
            playAudio(_audio);
          },
          child: Image.asset('assets/images/cao.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "gato";
            playAudio(_audio);
          },
          child: Image.asset('assets/images/gato.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "leao";
            playAudio(_audio);
          },
          child: Image.asset('assets/images/leao.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "macaco";
            playAudio(_audio);
          },
          child: Image.asset('assets/images/macaco.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "ovelha";
            playAudio(_audio);
          },
          child: Image.asset('assets/images/ovelha.png'),
        ),
        GestureDetector(
          onTap: () {
            _audio = "vaca";
            playAudio(_audio);
          },
          child: Image.asset('assets/images/vaca.png'),
        )
      ],
    );
  }

  void playAudio(String audio) {
    _player.play(AssetSource('audio/$audio.mp3'));
  }
}
