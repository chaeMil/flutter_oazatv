import 'package:flutter/material.dart';
import 'package:flutter_oazatv/api/api.dart';
import 'package:flutter_oazatv/model/video.dart';
import 'package:flutter_oazatv/screens/video_test.dart';

class HomeScreenState extends State<HomeScreen> {
  Future<List<Video>> videos;

  @override
  void initState() {
    super.initState();
    this._loadVideos();
  }

  bool _loadVideos() {
    videos = Api.getVideos();
    return true;
  }

  Widget _buildVideoList(List<Video> videos) {
    if (videos != null) {
      return ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, i) {
            return _buildRow(videos[i]);
          });
    } else {
      return Text("Error");
    }
  }

  Widget _buildRow(Video video) {
    return Card(
        margin: EdgeInsets.all(8),
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0))),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network("https://via.placeholder.com/150",
                      alignment: Alignment.center, fit: BoxFit.fitWidth),
                )),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      video.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      video.getTags(),
                      textAlign: TextAlign.left,
                    )
                  ],
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oáza.tv'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.videocam), onPressed: _openVideoTest)
        ],
      ),
      body: FutureBuilder<List<Video>>(
        future: videos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildVideoList(snapshot.data);
          } else if (snapshot.hasError) {
            return Column(
              children: <Widget>[
                Text("${snapshot.error}"),
                RaisedButton(
                  child: Text('Try again'),
                  onPressed: () {
                    this._loadVideos();
                  },
                )
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  void _openVideoTest() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return VideoApp();
    }));
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}
