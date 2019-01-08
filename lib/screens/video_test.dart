import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  @override
  Widget build(BuildContext context) {
    final playerWidget = new Chewie(
      new VideoPlayerController.network(
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'),
      aspectRatio: 21 / 9,
      autoPlay: true,
      looping: true,
    );

    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(child: playerWidget),
      ),
    );
  }
}
