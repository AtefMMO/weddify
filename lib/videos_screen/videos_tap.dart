import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/videos_screen/video_cubit.dart';

import 'video_container.dart';

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppTheme.secondaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Find the Best',
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              const Text(
                ' Deals, Anytime,\n Anywhere!',
                style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<VideoCubit, VideoState>(
                builder: (context, state) {
                  if (state.videos.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          print(state.videos.length);
                          return VideoContainer(video: state.videos[index]);
                        },
                        itemCount: state.videos.length,
                      ),
                    );
                  } else {
                    BlocProvider.of<VideoCubit>(context).getVideosList();
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
