import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';
import 'package:weddify/videos_screen/video_container.dart';


class AdminVideoItem extends StatelessWidget {
  VideoData video;
  AdminVideoItem({required this.video});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Stack(children: [
       Image.network(video.imageUrl??''),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: InkWell(
                  onTap: () {
                    FirebaseUtilsVideo.deleteData(video);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
