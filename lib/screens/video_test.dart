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
    final playerWidget = Chewie(
        VideoPlayerController.network(
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'),
        aspectRatio: 21 / 9,
        autoPlay: true,
        looping: false);

    return MaterialApp(
      title: 'Video Demo',
      theme: new ThemeData.light().copyWith(
        platform: TargetPlatform.iOS,
      ),
      home: Scaffold(
        body: Center(child: playerWidget),
      ),
    );
  }
}
