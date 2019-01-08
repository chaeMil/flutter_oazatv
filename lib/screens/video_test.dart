import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
