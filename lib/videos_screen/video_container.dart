import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';
import 'package:weddify/videos_screen/video_player.dart';

class VideoContainer extends StatelessWidget {
  VideoData video;

  VideoContainer({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(video),
                ),
              );
            },
            child: Stack(
              children: [
                Image.network(
                  video.imageUrl!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                const Center(
                  child: Icon(
                    Icons.play_circle,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
