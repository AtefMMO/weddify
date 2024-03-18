import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';


class AddNoteScreen extends StatefulWidget {
  @override
  State<AddNoteScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddNoteScreen> {
  var formKey = GlobalKey<FormState>();

  String noteName = 'Note title', noteDescription = 'Note description';

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
              'Add Note',
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
                              hintText: 'Enter Note title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Note Name';
                            }
                          },
                          onChanged: (value) {
                            noteName = value;
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
                            hintText: 'Enter Note description',
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Note description';
                            }
                          },
                          onChanged: (value) {
                            noteDescription = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              addOffer();
                            },
                            child: const Text(
                              'Add Note',
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

  void addOffer() async {
    if (formKey.currentState!.validate()) {
      NoteData note = NoteData(
        title: noteName,
        description: noteDescription,
      );

      try {
        await AdminFirebaseUtils.addNoteToFirebase(note);
        print('Note Added Successfully');
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Note Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e) {
        print('Error adding Note: $e');
        // Handle error adding note to Firebase
        Fluttertoast.showToast(
          msg: "Failed to add Note Please try again.",
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
