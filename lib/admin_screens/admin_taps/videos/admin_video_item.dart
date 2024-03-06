import 'package:flutter/material.dart';
import 'package:weddify/videos_screen/video_container.dart';

class AdminVideoItem extends StatelessWidget {
  const AdminVideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Stack(children: [
          Video('assets/images/img.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
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
