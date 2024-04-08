import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/videos_screen/video_cubit.dart';

import 'video_container.dart';

class Videos extends StatelessWidget {
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
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Find the Best',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  ' Deals, Anytime,\n Anywhere!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                BlocBuilder<VideoCubit, VideoState>(
                  builder: (context, state) {
                    if (state.videos.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            print(state.videos.length);
                            return Video(video: state.videos[index]);
                          },
                          itemCount: state.videos.length,
                        ),
                      );
                    } else {
                      BlocProvider.of<VideoCubit>(context).getVideosList();
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
