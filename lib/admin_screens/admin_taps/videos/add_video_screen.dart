import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/offers/add_offer_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';
import 'package:weddify/merchant_screens/user_image_picker.dart';

class AddVideoScreen extends StatefulWidget {
  @override
  State<AddVideoScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddVideoScreen> {
  var formKey = GlobalKey<FormState>();

  String videoName = 'Video title', videoUrl = '';
  File? videoImg;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Text(
              'Add Video',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Enter Video title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Video Name';
                            }
                          },
                          onChanged: (value) {
                            videoName = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Video url',
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Video url';
                            }
                          },
                          onChanged: (value) {
                            videoUrl = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'Select Item Image',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UserImagePicker(
                          onPickImage: (pickedImage) {
                            videoImg = pickedImage;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              addVideo();
                            },
                            child: const Text(
                              'Add Video',
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void addVideo() async {
    if (formKey.currentState!.validate()) {
      VideoData video = VideoData(
        title: videoName,
        image: videoImg,
        url: videoUrl,
      );

      try {
        await FirebaseUtilsVideo.addVideoToFirebase(video);
        print('Video Added Successfully');
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Video Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e) {
        print('Error adding video: $e');
        // Handle error adding video to Firebase
        Fluttertoast.showToast(
          msg: "Failed to add video Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
