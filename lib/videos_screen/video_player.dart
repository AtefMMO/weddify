import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  String ?video;
  VideoPlayerScreen([this.video]);
  final FlickManager flickManager = FlickManager(
    videoPlayerController:
        VideoPlayerController.asset('assets/videos/ashry.mp4'),
    autoPlay: false,
  );
  static const String routeName = 'VideoScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            flickManager.dispose();
            Navigator.pop(context);
          },
        ),
      ),
      body: AspectRatio(
          aspectRatio: 16 / 9,
          child: FlickVideoPlayer(
            flickManager: flickManager,
          )),
    );
  }
}
