import 'dart:convert';
import 'package:flutter_oazatv/model/video.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String server = "http://192.168.0.17:3000/";
  static const String apiVersion = "api/v3/";
  static const String api = server + apiVersion;

  static Future<List<Video>> getVideos({int page = 1}) async {
    final response = await http.get('$api/videos/?page=$page');
    if (response.statusCode == 200) {
      var videos = List<Video>();
      (json.decode(response.body) as List).forEach((jsonElement) {
        videos.add(Video.fromJson(jsonElement));
      });
      return videos;
    } else {
      throw ('Failed to get videos');
    }
  }
}
