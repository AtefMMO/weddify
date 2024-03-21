import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';

class Note extends StatelessWidget {
 NoteData ?note;

Note({required this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          children: [
            Center(child: Text(note!.title??'Note')),
            Center(child: Text(note!.description??'Description'))
          ],
        ),
      ),
    );
  }
}
