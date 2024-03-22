import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';


class EditVideoScreen extends StatefulWidget {
  late VideoData video;

  EditVideoScreen({required this.video});

  @override
  State<EditVideoScreen> createState() => _EditVideoScreenState();
}

class _EditVideoScreenState extends State<EditVideoScreen> {
  var formKey = GlobalKey<FormState>();

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
              'Edit Video',
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
                          initialValue: widget.video.title,
                          decoration: InputDecoration(
                              hintText: 'Enter Video title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Video title';
                            }
                          },
                          onChanged: (value) {
                            widget.video.title = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: widget.video.url,
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
                            widget.video.url = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                editNote(context);
                              }
                            },
                            child: const Text(
                              'Edit Video',
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

  editNote(BuildContext context) {
    FirebaseUtilsVideo.updateData(widget.video);
    Navigator.pop(context);

    Fluttertoast.showToast(
        msg: "Note Edited Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
