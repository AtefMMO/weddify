import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/videos_screen/video_player.dart';

class Video extends StatelessWidget {
  String? videoImage;
  Video([this.videoImage]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Center(
            child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, VideoPlayerScreen.routeName);
          },
          child: Stack(
            children: [
              Image.asset(
                '$videoImage',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                  child: Icon(
                Icons.play_circle,
                size: 50,
                color: Colors.white,
              ))
            ],
          ),
        )),
      ),
    );
  }
}
