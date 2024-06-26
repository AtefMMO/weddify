import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_screen.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_container_admin.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';

class NotesAdmin extends StatefulWidget {
  @override
  State<NotesAdmin> createState() => _NotesAdminState();
}

class _NotesAdminState extends State<NotesAdmin> {
  late List<NoteData> notes;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    CircularProgressIndicator();
    loadNotes();
  }

  void loadNotes() async {
    setState(() {
      isLoading = true;
    });

    notes = await FirebaseUtilsNote.getNoteFromFireBase();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showAddNoteScreen(context);
                    },
                    child: Text('Add Note'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loadNotes();
                    },
                    child: Text('ReLoad'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return noteContainerAdmin(
                            note: notes[index],
                          );
                        },
                        itemCount: notes.length,
                      ),
                    )
            ],
          ),
        )
      ],
    );
  }

  void showAddNoteScreen(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => AddNoteScreen());
  }
}
