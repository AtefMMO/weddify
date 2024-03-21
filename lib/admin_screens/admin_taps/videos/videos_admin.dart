import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_screen.dart';
import 'package:weddify/admin_screens/admin_taps/videos/admin_video_item.dart';
import 'package:weddify/videos_screen/video_container.dart';

class VideosAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/startScreen.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showAddVideoScreen(context);
                      },
                      child: Text('Add Videos'),
                    ),
                  ),
                  AdminVideoItem(),
                  AdminVideoItem(),
                  AdminVideoItem(),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void showAddVideoScreen(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => AddVideoScreen());
  }
}
