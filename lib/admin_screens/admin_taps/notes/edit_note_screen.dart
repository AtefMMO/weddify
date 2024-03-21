import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';


class EditNoteScreen extends StatefulWidget {
  late NoteData note;

  EditNoteScreen({required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
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
              'Edit Note',
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
                          initialValue: widget.note.title,
                          decoration: InputDecoration(
                              hintText: 'Enter Note title',
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Note title';
                            }
                          },
                          onChanged: (value) {
                            widget.note.title = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: widget.note.description,
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
                            widget.note.description = value;
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
                              'Edit Note',
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
    FirebaseUtilsNote.updateData(widget.note);
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
