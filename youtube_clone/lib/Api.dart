import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_clone/model/Video.dart';

const YOUTUBE_KEY = "AIzaSyD_-VCnFoWKvt9pL8FF-PQvsAZT05QSOiQ";
const CHANNEL_ID = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> search(String search) async {
    List<Video> videoList = List.empty();

    http.Response response = await http.get(Uri.parse(
        "${URL_BASE}search?part=snippet&type=video&maxResults=20&order=date&key=$YOUTUBE_KEY&q=$search"));

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
