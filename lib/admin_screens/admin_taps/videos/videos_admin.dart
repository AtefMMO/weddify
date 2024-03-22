import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_screen.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/videos/admin_video_item.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';

class VideosAdmin extends StatefulWidget {
  @override
  State<VideosAdmin> createState() => _NotesAdminState();
}

class _NotesAdminState extends State<VideosAdmin> {
  late List<VideoData> videos;
  bool isLoading = true;

  late int videoIndex;
  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  void loadVideos() async {
    setState(() {
      isLoading = true;
    });

    videos = await FirebaseUtilsVideo.getVideoFromFireBase();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showAddVideoScreen(context);
                      },
                      child: Text('Add Video'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        loadVideos();
                      },
                      child: Text('ReLoad'),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return AdminVideoItem(
                              video: videos[index],
                            );
                          },
                          itemCount: videos.length,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAddVideoScreen(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => AddVideoScreen());
  }
}
