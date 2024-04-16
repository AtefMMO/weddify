import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoData? video;

  VideoPlayerScreen([this.video]);

  static const String routeName = 'VideoScreen';

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.video!.url!);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    _controller.addListener(_onFullScreenChange);
  }

  void _onFullScreenChange() {
    setState(() {
      _isFullScreen = _controller.value.isFullScreen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              backgroundColor: AppTheme.mainColor,
              title: Text(widget.video!.title!),
              centerTitle: true,
              leading: InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: Stack(
        children: [
          Container(color: AppTheme.secondaryColor,),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          if (_isFullScreen)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  child: Icon(Icons.arrow_back, color: Colors.white),
                  onTap: () {
                    _controller.toggleFullScreenMode();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
