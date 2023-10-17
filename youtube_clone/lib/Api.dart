import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:youtube_clone/model/Video.dart';

final youtubeKEY = dotenv.env['YOUTUBE_API_KEY'];
final channelID = dotenv.env['CHANNEL_ID'];
final urlBase = dotenv.env['URL_BASE'];

class Api {
  Future<List<Video>> search(String search) async {
    List<Video> videoList = List.empty();

    http.Response response = await http.get(Uri.parse(
        "${urlBase}search?part=snippet&type=video&maxResults=20&order=date&key=$youtubeKEY&q=$search"));

    if (response.statusCode == 200) {
      // debugPrint("resultado" + response.body);
      Map<String, dynamic> data = json.decode(response.body);
      videoList = data["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
    }
    return videoList;
  }
}
