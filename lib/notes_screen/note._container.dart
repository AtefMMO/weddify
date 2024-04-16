import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';

class Note extends StatelessWidget {
  NoteData? note;

  Note({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(255, 255, 245, 216)),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(note!.title ?? 'Note'),
              Text(note!.description ?? 'Description'),
            ],
          ),
        ),
      ),
    );
  }
}
