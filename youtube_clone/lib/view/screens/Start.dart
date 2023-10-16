import 'package:flutter/material.dart';
import 'package:youtube_clone/Api.dart';
import 'package:youtube_clone/model/Video.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    _getVideos() {
      Api api = Api();
      return api.search("");
    }

    return FutureBuilder<List<Video>>(
        future: _getVideos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video> videoList = snapshot.data!;
                      Video video = videoList[index];
                      return Column(children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.image!),
                          )),
                        ),
                        ListTile(
                          title: (Text(video.title!)),
                          subtitle: (Text(video.channel!)),
                        )
                      ]);
                    },
                    separatorBuilder: (context, index) => const Divider(
                          height: 3,
                          color: Colors.red,
                        ),
                    itemCount: snapshot.data!.length);
              } else {
                return const Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
          }
        });
  }
}
