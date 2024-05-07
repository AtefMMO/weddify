import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';
import 'package:weddify/app_theme/app_theme.dart';

class Note extends StatelessWidget {
  NoteData? note;

  Note({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppTheme.lightGrey),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(note!.title ?? 'Note',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(note!.description ?? 'Description',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
